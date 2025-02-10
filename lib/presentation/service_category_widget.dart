import 'package:flutter/material.dart';
import 'package:handy_man/presentation/service_card.dart';

class SingleServiceCategory extends StatelessWidget {
  const SingleServiceCategory({
    super.key,
    required this.title,
    required this.singleService,
  });

  final String title;
  final List<Map<String, dynamic>> singleService;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20.0),
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 14.0),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: singleService.map(
            (item) {
              return SingleServiceCard(service: item);
            },
          ).toList(),
        )
      ],
    );
  }
}
