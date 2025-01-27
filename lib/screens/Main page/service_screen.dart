import 'package:flutter/material.dart';
import 'package:handy_man/components/service_category_widget.dart';
import '../../components/inputs/search_input.dart';
import '../../utils/screen_size_extension.dart';
import 'package:handy_man/data/data_service.dart';

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
        crossAxisAlignment: CrossAxisAlignment.start,
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
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.widthPercent(20.0),
              ),
              child: ListView.builder(
                itemCount: serviceCategory.length,
                itemBuilder: (context, index) => SingleServiceCategory(
                  singleService: serviceCategory[index],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
