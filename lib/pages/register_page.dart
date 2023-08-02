// ignore_for_file: must_be_immutable

import 'package:firebase_login_auth/const/color.dart';
import 'package:firebase_login_auth/service/auth/auth_service.dart';
import 'package:firebase_login_auth/widgets/my_button.dart';
import 'package:firebase_login_auth/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key, required this.onTap});

  void Function()? onTap;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

// Function to handle user sign-up
  void signUserUp() async {
    // Get an instance of the AuthService using Provider
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      // if the password and confirm password is same
      if (passwordController.text == confirmPasswordController.text) {
        // Extract the email and password from the text controllers
        String email =
            emailController.text.toString(); // Ensure email is of type String
        String password = passwordController.text
            .toString(); // Ensure password is of type String

        // Call the AuthService method to create a new user with email and password
        await authService.createNewUserWithEmailandPassword(email, password);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Registration success")));

      } else {
      // Show a snackbar if the passwords do not match
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Passwords do not match!")));
      }

      //catch if theres any error = email or password wrong
    } catch (e) {
          // Show a snackbar if there's an error during the registration process
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundScaffoldColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.message,
              size: 150,
            ),
            const SizedBox(
              height: 10,
            ),
            MyTextField(
              obscureText: false,
              hintText: "Email",
              controller: emailController,
            ),
            MyTextField(
              obscureText: true,
              hintText: "Password",
              controller: passwordController,
            ),
            MyTextField(
              obscureText: true,
              hintText: "Confirm Password",
              controller: confirmPasswordController,
            ),
            MyButton(
              newText: "Sign Up",
              onTap: signUserUp,
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already a member?"),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: const Text(
                    "Login now",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
