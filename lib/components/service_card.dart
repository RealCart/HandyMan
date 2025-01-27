import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:handy_man/models/service_card_category.dart';
import 'package:handy_man/screens/Services%20page/service_page.dart';

class SingleServiceCard extends StatelessWidget {
  const SingleServiceCard({
    super.key,
    required this.service,
  });

  final ServiceCardCategory service;

  void selectService(BuildContext context, ServiceCardCategory service) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ServicePage(serviceId: service.id),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.0,
      height: 82.0,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: Colors.black,
          width: 1.0,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: InkWell(
        onTap: () => selectService(context, service),
        child: Material(
          shadowColor: Colors.grey,
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                service.assetName,
                height: 40.0,
                width: 40.0,
              ),
              const SizedBox(height: 8.0),
              Text(
                service.label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 11,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
