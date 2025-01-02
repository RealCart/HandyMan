import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ServiceCard extends StatelessWidget {
  final List<ServiceItem> services;
  const ServiceCard({
    super.key,
    required this.services,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: services
          .map(
            (service) => SingleServiceCard(
              label: service.label,
              assetName: service.assetName,
            ),
          )
          .toList(),
    );
  }
}

class SingleServiceCard extends StatelessWidget {
  final String label;
  final String assetName;

  const SingleServiceCard({
    super.key,
    required this.label,
    required this.assetName,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            color: Colors.black,
            width: 1.0,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          )),
      child: InkWell(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(assetName),
            Text(
              label,
              style: const TextStyle(
                fontSize: 11,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ServiceItem {
  final String label;
  final String assetName;

  ServiceItem({
    required this.label,
    required this.assetName,
  });
}
