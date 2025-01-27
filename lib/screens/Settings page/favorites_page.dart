import 'package:flutter/material.dart';
import 'package:handy_man/utils/screen_size_extension.dart';
import '../../components/favorites_card.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F6F6),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        leading: const Icon(Icons.arrow_back_ios),
        title: const Text(
          "Избранное",
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.widthPercent(20.0),
          ),
          child: const Column(
            children: [FavoritesCard(label: "Уборка дома", hours: "3")],
          ),
        ),
      ),
    );
  }
}
