// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login_auth/const/color.dart';
import 'package:firebase_login_auth/widgets/my_button.dart';
import 'package:firebase_login_auth/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
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
    // (Note: In this function, we are not using authService directly, but we use the Firebase instance directly.)    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      // Use the Firebase instance to sign in the user with the provided email and password
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    // (Note: Since we are using the Firebase instance directly, we don't handle the success case here. If sign-in is successful, the user is signed in automatically.)
    } catch (e) {
          // Show a snackbar if there's an error during the sign-in process
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
