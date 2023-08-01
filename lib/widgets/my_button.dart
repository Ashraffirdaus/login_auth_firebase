// ignore_for_file: must_be_immutable

import 'package:firebase_login_auth/const/color.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
   MyButton({super.key, required this.newText , required this.onTap});
  final String newText;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 180, vertical: 20),
        decoration: BoxDecoration(
          color: myButtonColor,
          borderRadius: BorderRadius.circular(
            8.0,
          ),
        ),
        child: Text(
          newText,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
