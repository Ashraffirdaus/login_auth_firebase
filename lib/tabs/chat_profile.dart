import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatProfile extends StatefulWidget {
  const ChatProfile({super.key});

  @override
  State<ChatProfile> createState() => _ChatProfileState();
}

class _ChatProfileState extends State<ChatProfile> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("chat page"),
    );
  }
}