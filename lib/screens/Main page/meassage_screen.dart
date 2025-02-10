import 'package:flutter/material.dart';
import 'package:handy_man/presentation/orders_history_card.dart';
import 'package:handy_man/data/data_service.dart';

class MeassageScreen extends StatelessWidget {
  const MeassageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F6F6),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text(
          "История заказов",
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView.builder(
          itemCount: historyOfOrders.length,
          itemBuilder: (_, index) =>
              OrdersHistoryCard(ordersInfo: historyOfOrders[index]),
        ),
      ),
    );
  }
}
