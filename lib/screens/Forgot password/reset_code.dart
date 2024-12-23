import 'package:flutter/material.dart';
import 'package:handy_man/components/buttons/custom_button.dart';
import 'package:handy_man/components/textButtons/return_to_login.dart';
import '../../components/inputs/custom_pinput.dart';
import '../../utils/screen_size_extension.dart';

class ResetCode extends StatelessWidget {
  const ResetCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.widthPercent(32.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //Заголовок
                  const Text(
                    "Reset code",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  //Описание
                  const Text(
                    "We sent a 6-digit code to +7778887898",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: context.heightPercent(40.0),
                  ),

                  //Pinput
                  const CustomPinInput(
                    length: 6,
                  ),
                  SizedBox(
                    height: context.heightPercent(40.0),
                  ),

                  //"Resend" button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Didn’t get a code? ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
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
                          "Resend",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff33A3E8),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: context.heightPercent(69.0),
                  ),

                  //"Continue" button
                  CustomButton(
                    labelText: "Continue",
                    onPress: () {
                      Navigator.pushNamed(
                        context,
                        '/NewPassword',
                      );
                    },
                  ),
                  SizedBox(
                    height: context.heightPercent(8.0),
                  ),

                  //"Return to login" button

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
