import 'package:flutter/material.dart';

class ServiceHoursWidget extends StatelessWidget {
  const ServiceHoursWidget({
    super.key,
    required this.serviceHours,
  });

  final int serviceHours;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        gradient: const LinearGradient(
          colors: [
            Color(0xff33A3E8),
            Color(0xff63B9ED),
            Color(0xff3498DB),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 9.0,
        ),
        child: Text(
          '$serviceHours hours',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
