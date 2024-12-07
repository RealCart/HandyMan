import 'package:flutter/material.dart';
import 'package:handy_man/components/buttons/custom_button.dart';
import 'package:handy_man/components/inputs/custom_input.dart';
import 'package:handy_man/components/inputs/password_input.dart';

class SignUp extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(
            horizontal: 20.0,
          ),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 116,
                    ),

                    //Заголовок
                    const Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 40),

                    //Input "Name"
                    CustomInput(
                      labelText: "Name",
                      controller: nameController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    //Input "email/number"
                    CustomInput(
                      labelText: "Email/Number",
                      controller: emailController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    //Age and gender inputs
                    Row(
                      children: [
                        // Age Input
                        Expanded(
                            child: CustomInput(
                          labelText: "Age",
                          controller: ageController,
                        )),
                        const SizedBox(width: 10),
                        // Gender Input
                        Expanded(
                          child: CustomInput(
                            labelText: "Gender",
                            controller: genderController,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    PasswordInput(
                      controller: passwordController,
                      helperTextInput: "At least one capital letter",
                    ),
                    const SizedBox(
                      height: 28,
                    ),

                    CustomButton(
                      labelText: "Sign up",
                      paddingBtn: const EdgeInsets.symmetric(
                        horizontal: 155,
                        vertical: 17,
                      ),
                      onPress: () {},
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(
                    bottom: 16.0,
                  ),
                  child: Row(
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
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
