import 'package:flutter/material.dart';
import '../../utils/screen_size_extension.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leadingWidth: context.widthPercent(105.0),
          titleSpacing: 0.0,
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
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
            ],
          ),
          title: const Text(
            "Hello, Name!",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ),
        body: const Column(
          children: [],
        ),
      ),
    );
  }
}
