import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:handy_man/presentation/buttons/custom_button.dart';
import 'package:handy_man/models/history_orders.dart';

class OrdersHistoryCard extends StatelessWidget {
  const OrdersHistoryCard({
    super.key,
    required this.ordersInfo,
  });

  final HistoryOrders ordersInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(190, 187, 187, 0.12),
            blurRadius: 4,
            spreadRadius: 4,
            offset: Offset(1, 0),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(
            top: 19.0, right: 19.0, bottom: 22.0, left: 19.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: SvgPicture.asset("assets/icons/orderNumber.svg"),
                  ),
                  const WidgetSpan(child: SizedBox(width: 12.0)),
                  TextSpan(
                    text: "Заказ №${ordersInfo.orderNumber}",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 11.0),
            RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: SvgPicture.asset("assets/icons/orderStreet.svg"),
                  ),
                  const WidgetSpan(child: SizedBox(width: 12.0)),
                  TextSpan(
                    text: ordersInfo.adress,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 11.0),
            RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: SvgPicture.asset("assets/icons/orderTime.svg"),
                  ),
                  const WidgetSpan(child: SizedBox(width: 12.0)),
                  TextSpan(
                    text: "${ordersInfo.hours} часа",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 11.0),
            RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: SvgPicture.asset("assets/icons/orderDate.svg"),
                  ),
                  const WidgetSpan(child: SizedBox(width: 12.0)),
                  TextSpan(
                    text: ordersInfo.date,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 15.0),
            CustomButton(
              labelText: "Оставить отзыв",
              onPress: () {},
              height: 39.0,
            ),
          ],
        ),
      ),
    );
  }
}
