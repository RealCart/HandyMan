import 'package:flutter/material.dart';
import '../components/inputs/custom_input.dart';
import '../components/inputs/password_input.dart';
import 'package:handy_man/components/buttons/custom_button.dart';
import '../utils/screen_size_extension.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});
  final _fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: isKeyboardOpen
            ? const BouncingScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.widthPercent(32),
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: screenHeight - context.heightPercent(52.0),
            ),
            child: Center(
              child: Form(
                key: _fromKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Серый круг
                    const CircleAvatar(
                      radius: 94,
                      backgroundColor: Color(0xffD9D9D9),
                    ),
                    SizedBox(
                      height: context.heightPercent(20),
                    ),

                    // Приветственное сообщение
                    const Text(
                      'Welcome to HandyMan!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: context.heightPercent(40),
                    ),

                    // Инпут для email'a или номера
                    CustomInput(
                      labelText: 'Email/Number',
                      controller: emailController,
                    ),
                    SizedBox(
                      height: context.heightPercent(20),
                    ),

                    // Инпут для пароля
                    PasswordInput(
                      controller: passwordController,
                    ),
                    SizedBox(
                      height: context.heightPercent(44),
                    ),

                    // Кнопка Login
                    CustomButton(
                      labelText: 'Login',
                      onPress: () {
                        Navigator.pushNamed(context, '/MainNavigation');
                      },
                    ),
                    SizedBox(
                      height: context.heightPercent(8),
                    ),

                    // Кнопка 'Forgot password'
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/ForgotPassword');
                      },
                      style: TextButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text(
                        'Forgot password?',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: context.heightPercent(52.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Don’t have an account? ",
              style: TextStyle(color: Colors.black54),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/SignUp');
              },
              style: TextButton.styleFrom(
                minimumSize: Size.zero,
                padding: EdgeInsets.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: const Text(
                "Register!",
                style: TextStyle(
                  color: Color(0xff33A3E8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
