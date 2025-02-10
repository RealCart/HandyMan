import 'package:flutter/material.dart';
import 'package:handy_man/presentation/adresses_button.dart';
import 'package:handy_man/presentation/buttons/custom_button.dart';
import 'package:handy_man/data/data_service.dart';

class ManageAdresses extends StatelessWidget {
  const ManageAdresses({super.key});

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
          "Manage addresses",
          style: TextStyle(fontSize: 16),
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
            const SizedBox(height: 10.0),
            Expanded(
              child: ListView.builder(
                itemCount: userAdresses.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(
                    bottom: index != userAdresses.length ? 8.0 : 0.0,
                  ),
                  child: AdressesButton(
                    adresses: userAdresses[index],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
