import 'package:flutter/material.dart';
import 'package:handy_man/components/buttons/custom_button.dart';
import 'package:handy_man/components/card_methods_widget.dart';
import 'package:handy_man/data/data_service.dart';

class PaymentsMethods extends StatefulWidget {
  const PaymentsMethods({super.key});

  @override
  State<PaymentsMethods> createState() => _PaymentsMethodsState();
}

class _PaymentsMethodsState extends State<PaymentsMethods> {
  String? _selectedCardId = '1';

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
        title: const Text("Мои карты"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0 ),
        child: Column(
          children: [
            Expanded(
              child: CardsList(
                cards: cards,
                selectedCardId: _selectedCardId,
                onCardChanged: (String? newCardId) {
                  setState(() {
                    _selectedCardId = newCardId;
                  });
                },
              ),
            ),
            CustomButton(labelText: "+ Добавить карту", onPress: () {}),
          ],
        ),
      ),
    );
  }
}
