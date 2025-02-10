import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handy_man/bloc/auth_bloc/auth_bloc.dart';
import 'package:handy_man/data/models/signin_req_params.dart';
import '../presentation/inputs/custom_input.dart';
import '../presentation/inputs/password_input.dart';
import 'package:handy_man/presentation/buttons/custom_button.dart';
import '../utils/screen_size_extension.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  final _formKey = GlobalKey<FormState>();

  void login(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final signinParams = SigninReqParams(
        emailOrNumber: emailController.text,
        password: passwordController.text,
      );
      context.read<AuthBloc>().add(LoginEvent(userInfo: signinParams));
    }
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Please write Email or Number";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Please write your password";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return BlocProvider(
      create: (context) => AuthBloc(),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccessfully) {
            Navigator.pushReplacementNamed(context, "/MainNavigation");
          }
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${state.errorMessage}'),
              ),
            );
          }
        },
        child: Scaffold(
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
                child: Form(
                  key: _formKey,
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
                        validation: validateEmail,
                      ),
                      SizedBox(
                        height: context.heightPercent(20),
                      ),

                      // Инпут для пароля
                      PasswordInput(
                        controller: passwordController,
                        validation: validatePassword,
                      ),
                      SizedBox(
                        height: context.heightPercent(44),
                      ),

                      // Кнопка Login
                      BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          if (state is AuthLoading) {
                            return const CircularProgressIndicator(
                              backgroundColor:
                                  Color.fromARGB(255, 167, 165, 165),
                              color: Color(0xff33A3E8),
                            );
                          }
                          return CustomButton(
                            labelText: 'Login',
                            onPress: () => login(context),
                          );
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
        ),
      ),
    );
  }
}
