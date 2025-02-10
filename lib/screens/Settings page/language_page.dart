import 'package:flutter/material.dart';
import 'package:handy_man/data/data_service.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  String chosenLang = "Русский";

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
        centerTitle: true,
        title: const Text(
          "Language",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView.builder(
          itemCount: appLanguage.length,
          itemBuilder: (context, index) {
            final language = appLanguage[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 8.0),
              width: double.infinity,
              child: Material(
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.circular(30.0),
                color: chosenLang == language.languageTitle
                    ? const Color(0XFF33A3E8)
                    : Colors.white,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      chosenLang = language.languageTitle;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 14,
                      bottom: 14,
                      left: 17.0,
                    ),
                    child: Text(
                      language.languageTitle,
                      style: TextStyle(
                        color: chosenLang == language.languageTitle
                            ? Colors.white
                            : Colors.black,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
