import 'package:flutter/material.dart';

class LikeWidget extends StatefulWidget {
  const LikeWidget({super.key});

  @override
  State<LikeWidget> createState() => _LikeWidgetState();
}

class _LikeWidgetState extends State<LikeWidget> {
  bool likedState = false;

  void toggleButton() {
    setState(() {
      likedState = !likedState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: toggleButton,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Icon(
            Icons.favorite,
            color: likedState ? Colors.red : Colors.grey,
          ),
        ),
      ),
    );
  }
}
