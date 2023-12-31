// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'package:firebase_login_auth/const/color.dart';
import 'package:firebase_login_auth/service/auth/auth_service.dart';
import 'package:firebase_login_auth/widgets/my_button.dart';
import 'package:firebase_login_auth/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  LoginPage({super.key, required this.onTap});

  void Function()? onTap;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Function to handle user sign-in
  void signIn() async {
// Get an instance of the AuthService using Provider
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      // Use the Firebase instance to sign in the user with the provided email and password
      await authService.signInWithEmailandPassword(
          emailController.text, passwordController.text);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Login Success",
          ),
          backgroundColor: Colors.greenAccent,
        ),
      );
      // (Note: Since we are using the Firebase instance directly, we don't handle the success case here. If sign-in is successful, the user is signed in automatically.)
    } catch (e) {
      // Show a snackbar if there's an error during the sign-in process
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          ("Login Failed"),
        ),
        backgroundColor: Colors.red,
      ));
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
            MyButton(
              newText: "Sign In",
              onTap: signIn,
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Not a member?"),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: const Text(
                    "Register now",
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
