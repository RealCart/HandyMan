import 'package:flutter/material.dart';
import '../../utils/screen_size_extension.dart';
import '../../components/settings_options.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(context.heightPercent(40.0)),
        child: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () {},
                icon: Image.asset(
                  "assets/images/avatar.png",
                  width: context.widthPercent(40.0),
                  height: context.heightPercent(40.0),
                ),
              ),
              const Text(
                "Hello, Name!",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.widthPercent(20.0),
        ),
        child: Column(
          children: [
            SizedBox(
              height: context.heightPercent(30.0),
            ),
            SettingsOptions(
              label: "General",
              onTap: () {
                Navigator.pushNamed(context, "/SettingsPage/GeneralPage");
              },
            ),
            SettingsOptions(
              label: "Избранное",
              onTap: () {
                Navigator.pushNamed(context, '/SettingsPage/FavoritesPage');
              },
            ),
            SettingsOptions(
              label: "Subscriptions",
              onTap: () {
                Navigator.pushNamed(context, '/SettingsPage/UserSubsription');
              },
            ),
            SettingsOptions(
              label: "Payment methods",
              onTap: () {
                Navigator.pushNamed(context, '/SettingsPage/PaymentsMethods');
              },
            ),
            SettingsOptions(
              label: "Manage addresses",
              onTap: () {
                Navigator.pushNamed(context, "/SettingsPage/ManageAdresses");
              },
            ),
            SettingsOptions(label: "Payment history", onTap: () {}),
            SettingsOptions(label: "Help", onTap: () {}),
            SettingsOptions(
              label: "FAQ",
              onTap: () {
                Navigator.pushNamed(context, '/SettingsPage/FAQPage');
              },
            ),
          ],
        ),
      ),
    );
  }
}
