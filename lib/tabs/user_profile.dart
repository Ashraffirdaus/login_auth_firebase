import 'package:firebase_login_auth/widgets/profile_card.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: const [
            ProfileCard(
              fullName: "fullName",
              age: "age",
              email: "email",
              password: "password",
              uid: "uid",
            ),
          ],
        ),
      ),
    );
  }
}
