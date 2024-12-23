import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/screen_size_extension.dart';
import '../../components/inputs/search_input.dart';
import '../../components/sections_header.dart';
import '../../components/horizontal_category_list.dart';
import '../../components/buttons/custom_button.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController search = TextEditingController();

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
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                "assets/icons/profile.svg",
                              ),
                            ),
                            SizedBox(
                              width: context.widthPercent(15.0),
                            ),
                            const Text(
                              "Hi There!",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                "assets/icons/bell_icon.svg",
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
                SearchInput(
                  controller: search,
                  hintText: "Search for services",
                ),
                SizedBox(
                  height: context.heightPercent(20.0),
                ),
                Sectionsheader(
                  title: "Categories",
                  actionTitle: "View all",
                  onPressed: () {},
                ),
                SizedBox(
                  height: context.heightPercent(10.0),
                ),
                Horizontalcategorylist(
                  categories: [
                    CategoryItem(
                      onPressed: () {},
                      assetName: "assets/icons/worker.svg",
                      label: "Carpentry",
                    ),
                    CategoryItem(
                      onPressed: () {},
                      assetName: "assets/icons/worker.svg",
                      label: "Moving",
                    ),
                    CategoryItem(
                      onPressed: () {},
                      assetName: "assets/icons/plumber.svg",
                      label: "Plumber",
                    ),
                    CategoryItem(
                      onPressed: () {},
                      assetName: "assets/icons/cleaning.svg",
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
                  onPressed: () {},
                ),
                SizedBox(
                  height: context.heightPercent(10.0),
                ),
                Horizontalcategorylist(
                  categories: [
                    CategoryItem(
                      onPressed: () {},
                      assetName: "assets/icons/worker.svg",
                      label: "Cer",
                    ),
                    CategoryItem(
                      onPressed: () {},
                      assetName: "assets/icons/worker.svg",
                      label: "Moving",
                    ),
                    CategoryItem(
                      onPressed: () {},
                      assetName: "assets/icons/plumber.svg",
                      label: "Plumber",
                    ),
                    CategoryItem(
                      onPressed: () {},
                      assetName: "assets/icons/cleaning.svg",
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
