import 'package:flutter/material.dart';
import 'package:handy_man/presentation/buttons/custom_button.dart';
import 'package:handy_man/models/planned_card_data.dart';

import "package:flutter_svg/flutter_svg.dart";

class PlannedCardOrder extends StatelessWidget {
  const PlannedCardOrder({
    super.key,
    required this.plannedCardInfo,
  });

  final PlannedCardData plannedCardInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 10.0,
          right: 11.0,
          bottom: 14.0,
          left: 11.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              plannedCardInfo.title,
              style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8.0),
            RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: SvgPicture.asset(
                      "assets/icons/solar_calendar-linear.svg",
                    ),
                  ),
                  const WidgetSpan(child: SizedBox(width: 10.0)),
                  TextSpan(
                    text: plannedCardInfo.date,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15.0),
            CustomButton(
              labelText: "Детали услуги",
              height: 39.0,
              onPress: () {
                Navigator.pushNamed(
                  context,
                  '/MainNaviagtion/PlannedOrderPage',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
