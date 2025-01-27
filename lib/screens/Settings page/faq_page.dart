import 'package:flutter/material.dart';
import 'dart:math';

class FAQItem {
  final String question;
  final String answer;

  FAQItem({
    required this.question,
    required this.answer,
  });
}

class FAQPage extends StatefulWidget {
  const FAQPage({super.key});

  @override
  State<FAQPage> createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  final List<FAQItem> faqList = [
    FAQItem(
      question: 'How to make an order?',
      answer: '''
To place an order for housework services,\nsimply follow these steps:
1. Open the app and log in to your account.
2. Go to the "Services" section and browse\n     the available options.
3. Select the service you need and choose\n     your preferred date and time.
4. Provide any additional details or\n     instructions if required.
5. Confirm your order and proceed to\n     payment.
Once completed, you'll receive a confirmation\nwith all the details.
      ''',
    ),
    FAQItem(
      question: 'What payment methods are accepted?',
      answer: 'You can pay via credit card, PayPal, or cash on delivery.',
    ),
    FAQItem(
      question: 'Can I cancel or reschedule an order?',
      answer:
          'Yes, you can cancel or reschedule before the service provider starts travelling to you.',
    ),
    FAQItem(
      question: 'How do I contact customer support?',
      answer: 'Reach us via in-app chat, email, or phone call.',
    ),
    FAQItem(
      question: "Can I request a specific service provider?",
      answer: "No!",
    )
  ];

  final Map<int, bool> expandedState = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        centerTitle: true,
        title: const Text(
          "FAQ",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: faqList.length,
        itemBuilder: (context, index) {
          final faqitem = faqList[index];
          final isExpanded = expandedState[index] ?? false;

          return Theme(
            data: ThemeData().copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              backgroundColor: const Color(0xff33A3E8),
              minTileHeight: 40.0,
              trailing: Transform.rotate(
                angle: isExpanded ? 90 * pi / 180 : 0.0,
                child: Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: isExpanded ? Colors.white : Colors.black,
                  size: 15,
                ),
              ),
              title: Text(
                faqitem.question,
                style: TextStyle(
                  color: isExpanded ? Colors.white : Colors.black,
                ),
              ),
              children: [
                ListTile(
                  title: Text(
                    faqitem.answer,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
              onExpansionChanged: (bool expanded) {
                setState(() {
                  expandedState.updateAll((key, value) => value = false);
                  expandedState[index] = expanded;
                });
              },
            ),
          );
        },
      ),
    );
  }
}
