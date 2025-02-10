import 'package:flutter/material.dart';
import 'package:handy_man/presentation/inputs/search_input.dart';
import 'package:handy_man/screens/Main%20page/User%20order/planned_screen.dart';

class UserOrders extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  UserOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color(0xffF6F6F6),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            "Мои заказы",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Image.asset(
                "assets/images/notification_bell.png",
                width: 19.0,
                height: 19.0,
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                      hintText: "Search for orders",
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      color: Colors.white,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(2.0),
                      child: TabBar(
                        labelPadding: EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 3.0,
                        ),
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.black,
                        indicatorSize: TabBarIndicatorSize.tab,
                        dividerColor: Colors.transparent,
                        indicator: BoxDecoration(
                          color: Color(0xff33A3E8),
                          borderRadius: BorderRadius.all(
                            Radius.circular(30.0),
                          ),
                        ),
                        tabs: [
                          Text(
                            "Запланированные",
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "В процессе",
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "Законченные",
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            const PlannedScreen(),
            Container(
              color: Colors.purple,
              child: const Center(
                child: Text("wdadwawd"),
              ),
            ),
            Container(
              color: Colors.red,
              child: const Center(
                child: Text("wdadwawd"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
