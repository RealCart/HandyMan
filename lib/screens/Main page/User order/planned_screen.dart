import 'package:flutter/material.dart';
import 'package:handy_man/presentation/planned_card_order.dart';
import 'package:handy_man/data/data_service.dart';

class PlannedScreen extends StatelessWidget {
  const PlannedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView.builder(
        itemCount: plannedCard.length,
        itemBuilder: (_, index) =>
            PlannedCardOrder(plannedCardInfo: plannedCard[index]),
      ),
    );
  }
}
