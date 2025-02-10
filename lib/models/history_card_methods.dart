import 'package:handy_man/models/payment_card.dart';

class HistoryCardMethods extends PaymentCard {
  HistoryCardMethods(
      {required super.id,
      required super.cardType,
      required super.numberMask,
      required this.typeOfSubscription,
      required this.dateTime,
      required this.amountOfMoney});

  final String typeOfSubscription;
  final String dateTime;
  final int amountOfMoney;
}
