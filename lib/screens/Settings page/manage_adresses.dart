import 'package:flutter/material.dart';
import 'package:handy_man/components/buttons/custom_button.dart';

class ManageAdresses extends StatelessWidget {
  const ManageAdresses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          "Manage addresses",
          style: TextStyle(fontSize: 14),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Addresses",
              style: TextStyle(
                color: Color(0xff787878),
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 20.0),
            CustomButton(
              labelText: "+ Add new address",
              onPress: () {},
              height: 40.0,
            ),
          ],
        ),
      ),
    );
  }
}
