import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:handy_man/components/buttons/custom_button.dart';
import 'package:handy_man/components/inputs/custom_input.dart';
import 'package:handy_man/components/inputs/password_input.dart';
import '../utils/screen_size_extension.dart';
import 'package:http/http.dart' as http;

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

    if (phoneRegex.hasMatch(value)) {
      return null;
    } else if (!value.contains('@')) {
      return "Email must contain '@'";
    } else if (emailRegex.hasMatch(value)) {
      return null;
    }

    return "Email length must be between 5 and 30 and follow the correct format";
  }

  void _signUo() async {
    if (_formKey.currentState!.validate()) {
      final uri = Uri.http('10.0.2.2:4000', 'users/signup');
      try {
        final response = await http.post(
          uri,
          headers: {
            'Content-type': 'application/json',
          },
          body: json.encode(
            {
              'name': nameController.text,
              'email': emailController.text,
              'age': ageController.text,
              'gender': genderController.text,
              'password': passwordController.text,
            },
          ),
        );
        print(response.body);
      } catch (error) {
        print(">>>>>>>>>>>>>> ERROR: $error");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
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
                        CustomButton(
                          labelText: "Sign up",
                          onPress: _signUo,
                        ),
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
    );
  }
}
