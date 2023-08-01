import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_login_auth/firebase_options.dart';
import 'package:firebase_login_auth/service/auth/auth_page.dart';
import 'package:firebase_login_auth/service/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ChangeNotifierProvider(
    create: ((context) => AuthService()),child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  void onTAPPP(){

  }

  @override
  Widget build(BuildContext context) {
    return const  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthPage()
    );
  }
}
