import 'package:flutter/material.dart';
import 'package:handy_man/providers/bottom_bar_index.dart';
import '../../utils/screen_size_extension.dart';
import '../../components/inputs/search_input.dart';
import '../../components/sections_header.dart';
import '../../components/horizontal_category_list.dart';
import '../../components/buttons/custom_button.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xffF6F6F6),
      body: Column(
        children: [
          Container(
            color: const Color(0xffF1C40F),
            child: Column(
              children: [
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.widthPercent(20.0),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                    "assets/images/avatar.png",
                                    height: context.heightPercent(50.0),
                                    width: context.widthPercent(50.0),
                                  ),
                                ),
                                const Text(
                                  "Hi There!",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                "assets/images/notification_bell.png",
                                width: context.widthPercent(19.0),
                                height: context.heightPercent(19.0),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: context.heightPercent(10.0)),
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(50.0),
                            ),
                          ),
                          padding: EdgeInsets.only(
                            top: context.heightPercent(9.0),
                            bottom: context.heightPercent(19.0),
                            right: context.widthPercent(30.0),
                            left: context.widthPercent(30.0),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    "30 hours left",
                                    style: TextStyle(
                                      color: Color(0xff262626),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    width: context.widthPercent(5.0),
                                  ),
                                  const Text(
                                    "out of 40",
                                    style: TextStyle(
                                      color: Color(0xff6F6F6F),
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: const LinearProgressIndicator(
                                  value: 30 / 40,
                                  backgroundColor: Color(0xffE0E0E0),
                                  color: Colors.blueAccent,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(64.0),
                                  ),
                                  minHeight: 8,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: context.heightPercent(18.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: context.heightPercent(15.0),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.widthPercent(20.0),
            ),
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                        blurRadius: 20,
                        offset: Offset(6, 6),
                        spreadRadius: -4,
                      ),
                    ],
                  ),
                  child: SearchInput(
                    controller: searchController,
                    hintText: "Search for services",
                  ),
                ),
                SizedBox(
                  height: context.heightPercent(20.0),
                ),
                Sectionsheader(
                  title: "Categories",
                  actionTitle: "View all",
                  onPressed: () {
                    context.read<BottomBarIndex>().changeBarIndex(newIndex: 2);
                  },
                ),
                SizedBox(
                  height: context.heightPercent(10.0),
                ),
                Horizontalcategorylist(
                  categories: [
                    CategoryItem(
                      assetName: "assets/images/mechanic.png",
                      label: "Carpentry",
                    ),
                    CategoryItem(
                      assetName: "assets/images/mechanic.png",
                      label: "Moving",
                    ),
                    CategoryItem(
                      assetName: "assets/images/plumber.png",
                      label: "Plumber",
                    ),
                    CategoryItem(
                      assetName: "assets/images/cleaner.png",
                      label: "Cleaning",
                    ),
                  ],
                ),
                SizedBox(
                  height: context.heightPercent(20.0),
                ),
                Stack(
                  children: [
                    Image.asset('assets/images/bannerBg.png'),
                    Padding(
                      padding: EdgeInsets.only(
                        left: context.widthPercent(8.0),
                        top: context.heightPercent(20.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "Закажите услугу\nсейчас",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              height: 1,
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: context.heightPercent(10.0),
                          ),
                          CustomButton(
                            width: context.widthPercent(180.0),
                            height: context.heightPercent(35.0),
                            labelText: "Выбрать подписку",
                            btnStyle: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            onPress: () {},
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: context.heightPercent(20.0),
                ),
                Sectionsheader(
                  title: "Popular services",
                  actionTitle: "View all",
                  onPressed: () {
                    context.read<BottomBarIndex>().changeBarIndex(newIndex: 2);
                  },
                ),
                SizedBox(
                  height: context.heightPercent(10.0),
                ),
                Horizontalcategorylist(
                  categories: [
                    CategoryItem(
                      assetName: "assets/images/mechanic.png",
                      label: "Cer",
                    ),
                    CategoryItem(
                      assetName: "assets/images/mechanic.png",
                      label: "Moving",
                    ),
                    CategoryItem(
                      assetName: "assets/images/plumber.png",
                      label: "Plumber",
                    ),
                    CategoryItem(
                      assetName: "assets/images/cleaner.png",
                      label: "Cleaning",
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
