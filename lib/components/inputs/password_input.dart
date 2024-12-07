import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  final TextEditingController controller;
  final String helperTextInput;

  const PasswordInput({
    super.key,
    required this.controller,
    this.helperTextInput = "",
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
    return TextField(
      controller: widget.controller,
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: 'Password',
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
        helperText: widget.helperTextInput,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
      ),
      style: _obscureText
          ? (const TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 10,
            ))
          : (const TextStyle()),
    );
  }
}
