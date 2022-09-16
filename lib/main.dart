import 'package:flutter/material.dart';
import 'package:signup/ui/login.dart';
import 'package:signup/ui/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:signup/ui/welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'login',
      home: const Signup(),
      initialRoute: '/',
      routes: {
        '/signup': (context) => const Signup(),
        '/login': (context) => const Login(),
        '/welcome': (context) => const Welcome(),
      },
    ),
  );
}
