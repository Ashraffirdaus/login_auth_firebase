import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard(
      {super.key,
      required this.fullName,
      required this.age,
      required this.email,
      required this.password,
      required this.uid});

  final String fullName;
  final String age;
  final String email;
  final String uid;
  final String password;
  @override
  Widget build(BuildContext context) {
    return Container(

        decoration: const BoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Text(
              fullName,
              style: const TextStyle(fontSize: 20),
            ),
            Text(age,
                style: const TextStyle(
                  fontSize: 20,
                )),
            Text(email,
                style: const TextStyle(
                  fontSize: 20,
                )),
            Text(uid,
                style: const TextStyle(
                  fontSize: 20,
                )),
            Text(password,
                style: const TextStyle(
                  fontSize: 20,
                ))
          ],
        ));
  }
}
