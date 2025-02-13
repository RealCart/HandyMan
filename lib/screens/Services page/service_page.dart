import 'package:flutter/material.dart';
import 'package:handy_man/presentation/buttons/custom_button.dart';
import 'package:handy_man/presentation/rating_widget.dart';
import 'package:handy_man/presentation/service_hours_widget.dart';
import 'package:handy_man/screens/Services%20page/app_bar.dart';
import 'package:handy_man/screens/Services%20page/booking_service.dart';

class ServicePage extends StatelessWidget {
  const ServicePage({
    super.key,
    required this.service,
  });

  final Map<String, dynamic> service;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          const BasicAppBar(),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  service["name"],
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                RatingWidget(rating: service["rating"]),
                const SizedBox(
                  height: 10.0,
                ),
                ServiceHoursWidget(serviceHours: service["duration"]),
                const SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  const SizedBox(height: 20.0),
                  CustomButton(
                    labelText: "Book now ",
                    onPress: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              BookingService(service: service),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
