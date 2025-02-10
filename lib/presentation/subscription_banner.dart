import 'package:flutter/material.dart';
import '../utils/screen_size_extension.dart';

class SubscriptionBanner extends StatelessWidget {
  final String title;
  final String price;
  final String text;
  const SubscriptionBanner({
    super.key,
    required this.title,
    required this.price,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        gradient: LinearGradient(
          colors: [
            Color(0xff3498DB),
            Color(0xffC5DFF0),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: context.heightPercent(10.0),
          right: context.widthPercent(14.0),
          bottom: context.heightPercent(18.0),
          left: context.widthPercent(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: context.heightPercent(3.0),
            ),
            Text(
              price,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: context.heightPercent(4.0),
            ),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
