import 'package:flutter/material.dart';
import 'package:handy_man/screens/Forgot%20password/new_password.dart';
import 'package:handy_man/screens/sign_up.dart';
import 'screens/login.dart';
import 'screens/Forgot password/forgot_password.dart';
import 'screens/Forgot password/reset_code.dart';
import 'screens/Forgot password/password_changed.dart';
import './navigation/main_navigation.dart';

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
        '/ResetCode': (context) => const ResetCode(),
        '/NewPassword': (context) => NewPassword(),
        '/ForgotPassword': (context) => ForgotPassword(),
        '/PasswordChanged': (context) => const PasswordChangedPage(),
        '/MainNavigation': (context) => const MainNavigation(),
      },
    );
  }
}
