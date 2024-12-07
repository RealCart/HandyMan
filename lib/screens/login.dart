import 'package:flutter/material.dart';
import '../components/inputs/custom_input.dart';
import '../components/inputs/password_input.dart';
import 'package:handy_man/components/buttons/custom_button.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Серый круг баурсак
                    const CircleAvatar(
                      radius: 94,
                      backgroundColor: Color(0xffD9D9D9),
                    ),
                    const SizedBox(
                      height: 19,
                    ),

                    //Приветсвенное сообщение
                    const Text(
                      'Welcome to HandyMan!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),

                    //Инпут для email'a или номера
                    CustomInput(
                      labelText: 'Email/Number',
                      controller: emailController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    //Инпут для пароля
                    PasswordInput(
                      controller: passwordController,
                    ),
                    const SizedBox(
                      height: 44,
                    ),

                    //Кнопка для Login'a
                    CustomButton(
                      labelText: 'Login',
                      paddingBtn: const EdgeInsets.symmetric(
                        horizontal: 160,
                        vertical: 12,
                      ),
                      onPress: () {},
                    ),
                    const SizedBox(
                      height: 8,
                    ),

                    //Кнопка 'Forgot password?'
                    TextButton(
                      onPressed: () {},
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

              //Кнопка для регистрации
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 16.0,
                ),
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
            ],
          ),
        ),
      ),
    );
  }
}
