import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({super.key, required this.rating});

  final double rating;

  Widget stars(int index) {
    return Icon(
      Icons.star,
      size: 22.0,
      color: rating.round() > index
          ? const Color(0xffF1C40F)
          : const Color(0xffE8E8E8),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$rating',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        ...List.generate(5, (int index) => stars(index)),
      ],
    );
  }
}
