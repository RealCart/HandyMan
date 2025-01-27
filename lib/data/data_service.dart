import 'package:handy_man/models/payment_card.dart';
import 'package:handy_man/models/service.dart';
import 'package:handy_man/models/service_card_category.dart';
import 'package:handy_man/models/service_category.dart';

const serviceCategory = [
  ServiceCategoryData(
    title: "Cleaning services",
    services: [
      ServiceCardCategory(
        id: "a1",
        label: "House",
        assetName: "",
      ),
    ],
  ),
  ServiceCategoryData(
    title: "Plumbing",
    services: [
      ServiceCardCategory(
        id: "a1",
        label: "House",
        assetName: "",
      ),
    ],
  ),
];

const servicePageData = [
  Service(
    id: "a1",
    title: "Home deep cleaning",
    imageURL: "",
    rating: 4.1,
    amountOfHours: 3,
    description: [
      {
        "title": "Service includes",
        "description":
            "45 hours of handyman services, personalized home maintenance, and unlimited coordination for additional services like specialist work or seasonal offers",
      },
      {
        "title": "Cleaner will bring",
        "description":
            "45 hours of handyman services, personalized home maintenance, and unlimited coordination for additional services like specialist work or seasonal offers",
      },
    ],
  ),
  Service(
    id: "a2",
    title: "Home deep cleaning",
    imageURL: "",
    rating: 4.1,
    amountOfHours: 3,
    description: [
      {
        "title": "Service includes",
        "description":
            "45 hours of handyman services, personalized home maintenance, and unlimited coordination for additional services like specialist work or seasonal offers",
      },
      {
        "title": "Cleaner will bring",
        "description":
            "45 hours of handyman services, personalized home maintenance, and unlimited coordination for additional services like specialist work or seasonal offers",
      },
    ],
  ),
];

final List<PaymentCard> cards = [
  PaymentCard(
    id: '1',
    numberMask: '**** 4567',
    cardType: 'assets/icons/visa_card.svg',
  ),
  PaymentCard(
    id: '2',
    numberMask: '**** 5321',
    cardType: 'assets/icons/visa_card.svg',
  ),
];
