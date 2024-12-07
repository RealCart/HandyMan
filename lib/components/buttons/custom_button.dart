import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String labelText;
  final VoidCallback onPress;
  final ButtonStyle? btnStyle;
  final EdgeInsetsGeometry paddingBtn;

  const CustomButton({
    super.key,
    required this.labelText,
    required this.onPress,
    this.btnStyle,
    this.paddingBtn = const EdgeInsets.symmetric(
      horizontal: 0,
      vertical: 0,
    ),
  });

  @override
  Widget build(BuildContext context) {
    final defaultStyle = ElevatedButton.styleFrom(
      backgroundColor: Colors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      padding: paddingBtn,
    );

    final mergedStyle = defaultStyle.merge(btnStyle);

    return ElevatedButton(
      onPressed: onPress,
      style: mergedStyle,
      child: Text(
        labelText,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}
