import 'package:flutter/material.dart';
import 'package:handy_man/components/buttons/custom_button.dart';
import 'package:handy_man/components/inputs/password_input.dart';
import 'package:handy_man/components/textButtons/return_to_login.dart';
import '../../utils/screen_size_extension.dart';

class NewPassword extends StatelessWidget {
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController repeatNewPassword = TextEditingController();

  NewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
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
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: isKeyboardOpen
                ? const BouncingScrollPhysics()
                : const NeverScrollableScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height,
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.widthPercent(32.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Заголовок
                    const Text(
                      "New password",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),

                    //Описание
                    const Text(
                      "Create new password",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: context.heightPercent(40.0),
                    ),

                    //"New password" input
                    PasswordInput(
                      controller: newPassword,
                      inputLabel: "New password",
                      validation: (value) {},
                    ),

                    //"Repeat new password" input
                    PasswordInput(
                      controller: repeatNewPassword,
                      inputLabel: "Repeat new password",
                      validation: (value) {},
                    ),
                    SizedBox(
                      height: context.heightPercent(44.0),
                    ),

                    //"Contine" button
                    CustomButton(
                      labelText: "Continue",
                      onPress: () {
                        Navigator.pushNamed(context, '/PasswordChanged');
                      },
                    ),
                    SizedBox(
                      height: context.heightPercent(8.0),
                    ),

                    //"Return to login"

                    const ReturnToLogin(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
