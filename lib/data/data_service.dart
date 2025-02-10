import 'package:handy_man/models/history_card_methods.dart';
import 'package:handy_man/models/history_orders.dart';
import 'package:handy_man/models/language.dart';
import 'package:handy_man/models/payment_card.dart';
import 'package:handy_man/models/planned_card_data.dart';
import 'package:handy_man/models/service.dart';
import 'package:handy_man/models/service_card_category.dart';
import 'package:handy_man/models/service_category.dart';
import 'package:handy_man/models/user_adresses.dart';

const serviceCategory = [
  ServiceCategoryData(
    id: "2",
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
    id: "3",
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

const List<UserAdresses> userAdresses = [
  UserAdresses(city: "Astana", street: "Baraeva", houseNumber: "30"),
  UserAdresses(city: "Astana", street: "Konaeva", houseNumber: "3"),
  UserAdresses(city: "Astana", street: "Baraeva", houseNumber: "30"),
];

const List<Language> appLanguage = [
  Language(languageTitle: "Русский"),
  Language(languageTitle: "English"),
  Language(languageTitle: "Arabic"),
];

List<HistoryCardMethods> historyCards = [
  HistoryCardMethods(
    id: "1",
    numberMask: 'Visa **** 4567',
    cardType: "assets/icons/visa_card.svg",
    typeOfSubscription: "Подписка на месяц",
    dateTime: "6 мая, 2024",
    amountOfMoney: 250,
  ),
  HistoryCardMethods(
    id: "2",
    numberMask: 'Visa **** 4567',
    cardType: "assets/icons/visa_card.svg",
    typeOfSubscription: "Подписка на месяц",
    dateTime: "6 мая, 2024",
    amountOfMoney: 230,
  ),
];

List<HistoryOrders> historyOfOrders = [
  HistoryOrders(
    id: "1",
    orderNumber: "2738",
    adress: "2948 Drive street",
    hours: 3,
    date: "Среда, 15 декабря в 10:00",
  ),
  HistoryOrders(
    id: "1",
    orderNumber: "2738",
    adress: "2948 Drive street",
    hours: 3,
    date: "Среда, 15 декабря в 10:00",
  ),
];

List<PlannedCardData> plannedCard = [
  PlannedCardData(
    title: "Уборка дома",
    date: "15 декабря, пятница",
  ),
  PlannedCardData(
    title: "Уборка дома",
    date: "15 декабря, пятница",
  ),
  PlannedCardData(
    title: "Уборка дома",
    date: "15 декабря, пятница",
  ),
  PlannedCardData(
    title: "Уборка дома",
    date: "15 декабря, пятница",
  ),
  PlannedCardData(
    title: "Уборка дома",
    date: "15 декабря, пятница",
  ),
  PlannedCardData(
    title: "Уборка дома",
    date: "15 декабря, пятница",
  ),
];
