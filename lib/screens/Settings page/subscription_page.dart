import 'package:flutter/material.dart';
import 'package:handy_man/components/Subsctription/subscription_hourly.dart';
import 'package:handy_man/utils/screen_size_extension.dart';
import 'package:handy_man/components/Subsctription/subscription_monthly.dart';
import 'package:handy_man/components/Subsctription/subscription_yearly.dart';

class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({super.key});

  @override
  State<SubscriptionPage> createState() => _SubscriptioPageState();
}

class _SubscriptioPageState extends State<SubscriptionPage> {
  // int curr = 0;

  // final List currBanner = [
  //   const SubscriptionMonthly(),
  //   const SubscriptionMonthly(),
  // ];

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
          "Подписки",
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.widthPercent(20.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Помесячно",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: context.heightPercent(13.0),
              ),
              const SubscriptionMonthly(),
              SizedBox(
                height: context.heightPercent(30.0),
              ),
              const Text(
                "Годовая",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: context.heightPercent(13.0),
              ),
              const SubscriptionYearly(),
              SizedBox(
                height: context.heightPercent(30.0),
              ),
              const Text(
                "Дополнительные часы",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: context.heightPercent(13.0),
              ),
              const SubscriptionHourly(),
              SizedBox(
                height: context.heightPercent(30.0),
              )
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: List.generate(
              //     currBanner.length,
              //     (index) {
              //       return InkWell(
              //         splashColor: Colors.transparent,
              //         highlightColor: Colors.transparent,
              //         onTap: () {
              //           setState(() {
              //             curr = index;
              //           });
              //         },
              //         child: Container(
              //           margin: const EdgeInsets.only(right: 9.0),
              //           width: context.widthPercent(16.0),
              //           height: context.heightPercent(16.0),
              //           decoration: BoxDecoration(
              //             color: index == curr
              //                 ? const Color(0xff33A3E8)
              //                 : const Color(0XffDCDCDC),
              //             shape: BoxShape.circle,
              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
