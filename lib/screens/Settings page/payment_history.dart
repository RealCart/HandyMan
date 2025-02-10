import 'package:flutter/material.dart';
import 'package:handy_man/presentation/payment_history_widget.dart';
import 'package:handy_man/data/data_service.dart';

class PaymentHistory extends StatelessWidget {
  const PaymentHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F6F6),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          "История платежей",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView.builder(
          itemCount: historyCards.length,
          itemBuilder: (context, index) {
            final card = historyCards[index];
            return PaymentHistoryWidget(card: card);
          },
        ),
      ),
    );
  }
}
