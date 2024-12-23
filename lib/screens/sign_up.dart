import 'package:flutter/material.dart';
import 'package:handy_man/components/buttons/custom_button.dart';
import 'package:handy_man/components/inputs/custom_input.dart';
import 'package:handy_man/components/inputs/password_input.dart';
import '../utils/screen_size_extension.dart';

class SignUp extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignUp({super.key});

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
                      ),
                      SizedBox(height: context.heightPercent(20.0)),

                      // Инпут Email/Number
                      CustomInput(
                        labelText: "Email/Number",
                        controller: emailController,
                      ),
                      SizedBox(height: context.heightPercent(20.0)),

                      // Age и Gender
                      Row(
                        children: [
                          Expanded(
                            child: CustomInput(
                              labelText: "Age",
                              controller: ageController,
                            ),
                          ),
                          SizedBox(width: context.widthPercent(20.0)),
                          Expanded(
                            child: CustomInput(
                              labelText: "Gender",
                              controller: genderController,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: context.heightPercent(20.0)),

                      // Password Input
                      PasswordInput(
                        controller: passwordController,
                        helperTextInput: "At least one capital letter",
                      ),
                      SizedBox(height: context.heightPercent(28.0)),

                      // Кнопка Sign up
                      CustomButton(
                        labelText: "Sign up",
                        onPress: () {},
                      ),
                      SizedBox(height: context.heightPercent(40.0)),
                    ],
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
