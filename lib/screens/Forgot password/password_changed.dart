import 'package:flutter/material.dart';
import '../../utils/screen_size_extension.dart';
import '../../components/buttons/custom_button.dart';

class PasswordChangedPage extends StatelessWidget {
  const PasswordChangedPage({super.key});

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
                  Image.asset("assets/images/successfullyChanged.png"),
                  SizedBox(
                    height: context.heightPercent(39.0),
                  ),
                  const Text(
                    "Password changed!",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Text(
                    "Your password has been changed successfully",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: context.heightPercent(40.0),
                  ),
                  CustomButton(
                    labelText: "Return to login",
                    onPress: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/',
                        (route) => false,
                      );
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
