import 'package:flutter/material.dart';
import '../../utils/screen_size_extension.dart';

class PasswordInput extends StatefulWidget {
  final TextEditingController controller;
  final String inputLabel;
  final FormFieldValidator<String>? validation;

  const PasswordInput({
    super.key,
    required this.controller,
    this.validation,
    this.inputLabel = "Password",
  });

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorHeight: 20,
      controller: widget.controller,
      obscureText: _obscureText,
      cursorColor: const Color(0xff7C7C7C),
      validator: widget.validation,
      decoration: InputDecoration(
        labelText: widget.inputLabel,
        labelStyle: const TextStyle(
          color: Color(0xff7C7C7C),
        ),
        filled: true,
        fillColor: const Color.fromRGBO(51, 163, 232, 0.13),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: _togglePasswordVisibility,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: context.widthPercent(20.0),
        ),
      ),
      style: _obscureText
          ? (const TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 8,
              fontSize: 24,
            ))
          : (const TextStyle()),
    );
  }
}
