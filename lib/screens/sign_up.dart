import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handy_man/bloc/auth_bloc/auth_bloc.dart';
import 'package:handy_man/presentation/buttons/custom_button.dart';
import 'package:handy_man/presentation/inputs/custom_input.dart';
import 'package:handy_man/presentation/inputs/password_input.dart';
import 'package:handy_man/data/models/signup_req_params.dart';
import '../utils/screen_size_extension.dart';

class SignUp extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignUp({super.key});

  final _formKey = GlobalKey<FormState>();

  String? validatePassword(String? value) {
    final RegExp regExp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{10,}$');
    final RegExp capitalLetter = RegExp(r'^(?=.*?[A-Z])');
    final RegExp lowercaseLetter = RegExp(r'^(?=.*?[a-z])');
    final RegExp digitNumber = RegExp(r'^(?=.*?[0-9])');
    final RegExp specialCharacter = RegExp(r'^(?=.*?[!@#\$&*~])');
    final RegExp minLength = RegExp(r'^.{10,}$');

    if (value == null || value.isEmpty) {
      return "Please enter your password.";
    }

    if (regExp.hasMatch(value)) {
      return null;
    }

    List<String> missingCriteria = [];

    if (!capitalLetter.hasMatch(value)) {
      missingCriteria.add("an uppercase letter");
    } else if (!lowercaseLetter.hasMatch(value)) {
      missingCriteria.add("a lowercase letter");
    } else if (!digitNumber.hasMatch(value)) {
      missingCriteria.add("a digit");
    } else if (!specialCharacter.hasMatch(value)) {
      missingCriteria.add("a special character (!@#\$&*~)");
    } else if (!minLength.hasMatch(value)) {
      missingCriteria.add("a minimum of 10 characters");
    }

    return "Password must contain: " + missingCriteria.join(", ") + ".";
  }

  String? validationEmailNumber(String? value) {
    if (value == null || value.isEmpty) {
      return "Please write Email or Number";
    }

    final RegExp phoneRegex = RegExp(r'^\+\d{12}$');
    final RegExp emailRegex = RegExp(
        r'^(?=.{5,30}$)(?!\+)[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$');

    if (value[0] == '+' && !phoneRegex.hasMatch(value)) {
      return "Phone number length must be 12";
    } else if (!emailRegex.hasMatch(value)) {
      return "Email length must be between 5 and 30 and follow the correct format";
    }

    return null;
  }

  void signUp(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final signupParams = SignupReqParams(
        name: nameController.text,
        emailOrNumber: emailController.text,
        age: ageController.text,
        gender: genderController.text,
        password: passwordController.text,
      );
      context.read<AuthBloc>().add(SingUpEvent(userInfo: signupParams));
    }
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
                content: Text(state.errorMessage),
              ),
            );
          }
        },
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
          ),
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              SingleChildScrollView(
                physics: isKeyboardOpen
                    ? const BouncingScrollPhysics()
                    : const NeverScrollableScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.widthPercent(20.0),
                  ),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: screenHeight - context.heightPercent(52.0),
                    ),
                    child: Center(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Заголовок
                            const Text(
                              "Sign up",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: context.heightPercent(20.0)),

                            // Инпут Name
                            CustomInput(
                              labelText: "Name",
                              controller: nameController,
                              validation: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Name must contain at least 1 character";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: context.heightPercent(20.0)),

                            // Инпут Email/Number
                            CustomInput(
                              labelText: "Email/Number",
                              controller: emailController,
                              validation: validationEmailNumber,
                            ),
                            SizedBox(height: context.heightPercent(20.0)),

                            // Age и Gender
                            Row(
                              children: [
                                Expanded(
                                  child: CustomInput(
                                    labelText: "Age",
                                    controller: ageController,
                                    validation: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please write your age";
                                      } else if (int.parse(value) <= 16) {
                                        return 'Too young!';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(width: context.widthPercent(20.0)),
                                Expanded(
                                  child: CustomInput(
                                    labelText: "Gender",
                                    controller: genderController,
                                    validation: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please select the gender';
                                      }

                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: context.heightPercent(20.0)),

                            // Password Input
                            PasswordInput(
                              controller: passwordController,
                              validation: validatePassword,
                            ),
                            SizedBox(height: context.heightPercent(28.0)),

                            // Кнопка Sign up
                            Builder(builder: (context) {
                              return CustomButton(
                                labelText: "Sign up",
                                onPress: () => signUp(context),
                              );
                            }),
                            SizedBox(height: context.heightPercent(40.0)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(bottom: context.heightPercent(52.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "By signing up you agree with our ",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    minimumSize: Size.zero,
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Text(
                    "Terms and Conditions",
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
