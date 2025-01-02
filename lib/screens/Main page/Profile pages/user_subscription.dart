import 'package:flutter/material.dart';
import '../../../components/subscription_banner.dart';
import '../../../utils/screen_size_extension.dart';
import '../../../components/progress_circle.dart';
import '../../../components/buttons/custom_button.dart';

class UserSubscription extends StatelessWidget {
  const UserSubscription({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.widthPercent(20.0),
        ),
        child: Column(
          children: [
            const SubscriptionBanner(
              title: "Month subscription",
              price: "AED250/mo",
              text:
                  "45 hours of handyman services, personalized home maintenance, and unlimited coordination for additional services like specialist work or seasonal offers ",
            ),
            SizedBox(height: context.heightPercent(20.0)),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const GradientCircle(progress: 30 / 40),
                SizedBox(width: context.widthPercent(25.0)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "30 hours left",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: context.heightPercent(5.0),
                    ),
                    const Text(
                      "Available until 30/03/2025",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: context.heightPercent(20.0),
                    ),
                    CustomButton(
                      labelText: "Extend subscription",
                      onPress: () {},
                      width: context.heightPercent(188.0),
                      height: context.heightPercent(40.0),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
