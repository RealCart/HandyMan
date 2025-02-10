import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:handy_man/models/history_card_methods.dart';

class PaymentHistoryWidget extends StatelessWidget {
  const PaymentHistoryWidget({
    super.key,
    required this.card,
  });

  final HistoryCardMethods card;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 7.0),
      decoration: BoxDecoration(
        color: const Color(0xffE5F3FC),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          top: 10.0,
          right: 20.0,
          bottom: 14.0,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  card.typeOfSubscription,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
                Text(
                  card.dateTime,
                  style: const TextStyle(
                    color: Color(0xff787878),
                    fontSize: 14,
                  ),
                )
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(card.cardType),
                    const SizedBox(width: 29.0),
                    Text(card.numberMask,
                        style: const TextStyle(fontSize: 14.0)),
                  ],
                ),
                Text('AED ${card.amountOfMoney}',
                    style: const TextStyle(fontSize: 14.0)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
