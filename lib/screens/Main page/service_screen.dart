import 'package:flutter/material.dart';
import '../../components/inputs/search_input.dart';
import '../../utils/screen_size_extension.dart';
import '../../components/service_card.dart';

class ServiceScreen extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  ServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xffF1C40F),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
        title: const Text(
          "Browse Category",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xffF1C40F),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: context.heightPercent(5.0),
                bottom: context.heightPercent(20.0),
                left: context.widthPercent(20.0),
                right: context.widthPercent(20.0),
              ),
              child: SearchInput(
                controller: searchController,
                hintText: "Search",
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.widthPercent(20.0),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: context.heightPercent(20.0),
                ),
                ServiceCard(services: [
                  ServiceItem(
                    label: "House",
                    assetName: "assets/icons/worker.svg",
                  ),
                  ServiceItem(
                    label: "Carpet",
                    assetName: "assets/icons/worker.svg",
                  ),
                  ServiceItem(
                    label: "Windows",
                    assetName: "assets/icons/worker.svg",
                  ),
                  ServiceItem(
                    label: "Exterior\nhome",
                    assetName: "assets/icons/worker.svg",
                  ),
                  ServiceItem(
                    label: "House",
                    assetName: "assets/icons/worker.svg",
                  ),
                  ServiceItem(
                    label: "Interior\nhome",
                    assetName: "assets/icons/worker.svg",
                  ),
                ])
              ],
            ),
          )
        ],
      ),
    );
  }
}
