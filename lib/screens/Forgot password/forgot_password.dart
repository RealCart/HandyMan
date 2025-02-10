import 'package:flutter/material.dart';
import 'package:handy_man/presentation/textButtons/return_to_login.dart';
import '../../presentation/inputs/custom_input.dart';
import '../../presentation/inputs/password_input.dart';
import '../../presentation/buttons/custom_button.dart';
import '../../utils/screen_size_extension.dart';

class ForgotPassword extends StatelessWidget {
  final TextEditingController emailControler = TextEditingController();
  final TextEditingController passwordContoler = TextEditingController();

  ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.widthPercent(32.0),
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //Заголовок
                  const Text(
                    "Forgot password?",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  //Описание
                  const Text(
                    "We’ll send you reset instructions",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    height: context.heightPercent(40.0),
                  ),

                  //Email input
                  CustomInput(
                    labelText: "Email/Number",
                    controller: emailControler,
                    validation: (value) {},
                  ),
                  SizedBox(
                    height: context.heightPercent(20.0),
                  ),

                  //Password input
                  PasswordInput(
                    controller: passwordContoler,
                    validation: (value) {},
                  ),
                  SizedBox(
                    height: context.heightPercent(44.0),
                  ),

                  //"Set new password" button
                  CustomButton(
                    labelText: "Set new password",
                    onPress: () {
                      Navigator.pushNamed(context, '/ResetCode');
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
        ],
      ),
    );
  }
}
