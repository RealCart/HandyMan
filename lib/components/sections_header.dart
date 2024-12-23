import 'package:flutter/material.dart';

class Sectionsheader extends StatelessWidget {
  final String title;
  final String actionTitle;
  final VoidCallback onPressed;

  const Sectionsheader({
    super.key,
    required this.title,
    required this.actionTitle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        InkWell(
          onTap: onPressed,
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          child: Text(
            actionTitle,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
            ),
          ),
        )
      ],
    );
  }
}
