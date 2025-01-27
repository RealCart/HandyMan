import 'package:flutter/material.dart';
import 'package:handy_man/models/payment_card.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardsList extends StatelessWidget {
  final List<PaymentCard> cards;
  final String? selectedCardId;
  final ValueChanged<String?>? onCardChanged;

  const CardsList({
    super.key,
    required this.cards,
    required this.selectedCardId,
    required this.onCardChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cards.length,
      itemBuilder: (context, index) {
        final card = cards[index];
        final bool isSelected = (selectedCardId == card.id);
        return Container(
          margin: EdgeInsets.only(bottom: index != cards.length ? 5.0 : 0.0),
          child: ListTile(
            visualDensity: const VisualDensity(
              vertical: VisualDensity.minimumDensity,
            ),
            contentPadding: const EdgeInsets.only(
              right: 15.0,
              left: 9.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            tileColor: Colors.white,
            onTap: () {
              if (onCardChanged != null) {
                onCardChanged!(card.id);
              }
            },
            title: Row(
              children: [
                SvgPicture.asset(card.cardType, width: 32.0, height: 14.0),
                const SizedBox(width: 29),
                Text(card.numberMask),
              ],
            ),
            trailing: Icon(
              isSelected ? Icons.check_circle : Icons.check_circle_outline,
              size: 24.0,
              color: isSelected ? Colors.blue : Colors.black,
            ),
          ),
        );
      },
    );
  }
}
