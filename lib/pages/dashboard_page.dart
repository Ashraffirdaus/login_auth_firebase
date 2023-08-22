import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login_auth/tabs/chat_profile.dart';
import 'package:firebase_login_auth/tabs/user_profile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  void navigationBarIndex (int index){
    setState(() {
      currentIndex =index;
    });
  }
  final List _tabs = [
   const  ChatProfile(),
    const UserProfile(),
  ];
  void signOut() async {
    return await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
        onPressed: signOut,
        icon: const Icon(Icons.logout),
      )),
      body: _tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: navigationBarIndex,
        items: const [
          
        BottomNavigationBarItem(

          icon: Icon(Icons.chat),
          label: "Chat",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Profile",
        ),
      
      
      ]),
    );
  }
}
