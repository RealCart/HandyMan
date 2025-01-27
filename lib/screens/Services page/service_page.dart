import 'package:flutter/material.dart';
import 'package:handy_man/components/buttons/custom_button.dart';
import 'package:handy_man/components/rating_widget.dart';
import 'package:handy_man/components/service_hours_widget.dart';
import 'package:handy_man/data/data_service.dart';
import 'package:handy_man/screens/Services%20page/app_bar.dart';
import 'package:handy_man/screens/Services%20page/booking_service.dart';

class ServicePage extends StatelessWidget {
  const ServicePage({
    super.key,
    required this.serviceId,
  });

  final String serviceId;

  @override
  Widget build(BuildContext context) {
    final filteredService =
        servicePageData.singleWhere((element) => element.id == serviceId);

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
                  filteredService.title,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                RatingWidget(rating: filteredService.rating),
                const SizedBox(
                  height: 10.0,
                ),
                ServiceHoursWidget(serviceHours: filteredService.amountOfHours),
                const SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final item = filteredService.description[index];
                return ListTile(
                  title: Text(
                    item['title']!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Text(
                    item['description']!,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                );
              },
              childCount: filteredService.description.length,
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
                              BookingService(service: filteredService),
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
