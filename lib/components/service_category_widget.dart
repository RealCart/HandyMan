import 'package:flutter/material.dart';
import 'package:handy_man/components/service_card.dart';
import 'package:handy_man/models/service_category.dart';

class SingleServiceCategory extends StatelessWidget {
  const SingleServiceCategory({
    super.key,
    required this.singleService,
  });

  final ServiceCategoryData singleService;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20.0),
        Text(
          singleService.title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: singleService.services.map(
            (service) {
              return SingleServiceCard(service: service);
            },
          ).toList(),
        )
      ],
    );
  }
}
