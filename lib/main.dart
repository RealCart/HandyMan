import 'package:flutter/material.dart';
import 'package:handy_man/screens/sign_up.dart';
import 'screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/SignUp': (context) => SignUp(),
      },
    );
  }
}
