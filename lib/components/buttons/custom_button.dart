import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String labelText;
  final VoidCallback onPress;
  final ButtonStyle? btnStyle;
  final double? width;
  final double? height;

  const CustomButton({
    super.key,
    required this.labelText,
    required this.onPress,
    this.height = 52.0,
    this.width = double.infinity,
    this.btnStyle,
  });

  @override
  Widget build(BuildContext context) {
    final defaultStyle = ElevatedButton.styleFrom(
      backgroundColor: const Color(0xff33A3E8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    );

    final mergedStyle = defaultStyle.merge(btnStyle);

    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPress,
        style: mergedStyle,
        child: Text(
          labelText,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
