import 'package:handy_man/models/service_card_category.dart';

class ServiceCategoryData {
  const ServiceCategoryData({
    required this.title,
    required this.services,
  });

  final String title;
  final List<ServiceCardCategory> services;
}
