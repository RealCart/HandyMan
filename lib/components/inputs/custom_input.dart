import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String labelText;
  final bool obscureText;
  final TextEditingController controller;
  final Icon? prefixIcon;
  final IconButton? suffixIcon;
  final TextInputType keyboardType;

  const CustomInput({
    super.key,
    required this.labelText,
    required this.controller,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      cursorColor: const Color(0xff7C7C7C),
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelStyle: const TextStyle(
          color: Color(0xff7C7C7C),
        ),
        labelText: labelText,
        filled: true,
        fillColor: const Color.fromRGBO(51, 163, 232, 0.13),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      ),
    );
  }
}
