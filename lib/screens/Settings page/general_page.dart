import 'package:flutter/material.dart';
import '../../presentation/settings_options.dart';
import '../../utils/screen_size_extension.dart';
import 'package:handy_man/presentation/language_option.dart';
import 'package:handy_man/presentation/push_notification_switcher.dart';

class GeneralPage extends StatelessWidget {
  const GeneralPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F6F6),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          "Основные",
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.widthPercent(20.0),
        ),
        child: Column(
          children: [
            const PushNotificationSwitcher(label: "Push-уведомления"),
            SettingsOptions(label: "Настройки безопасности", onTap: () {}),
            SettingsOptions(label: "Политика конфиденциальности", onTap: () {}),
            LanguageOption(
              label: "Language",
              subTitle: "Русский",
              onTap: () {
                Navigator.pushNamed(
                    context, '/SettingsPage/GeneralPage/LanguagePage');
              },
            )
          ],
        ),
      ),
    );
  }
}
