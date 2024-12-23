import 'package:flutter/material.dart';

class ReturnToLogin extends StatelessWidget {
  const ReturnToLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/',
          (route) => false,
        );
      },
      style: TextButton.styleFrom(
        minimumSize: Size.zero,
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: const Text(
        "Return to login",
        style: TextStyle(
          fontSize: 17,
          color: Colors.black,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
