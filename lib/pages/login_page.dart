// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login_auth/const/color.dart';
import 'package:firebase_login_auth/service/auth/auth_service.dart';
import 'package:firebase_login_auth/widgets/my_button.dart';
import 'package:firebase_login_auth/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signIn()async{
    //get instance Auth /import the isntance Auth
    final authService =Provider.of<AuthService>(context, listen:false);
    try{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
    //catch if theres any error = email or password wrong
    }catch (e) {
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
          ],
        ),
      ),
    );
  }
}
