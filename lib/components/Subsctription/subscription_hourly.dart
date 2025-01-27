import 'package:flutter/material.dart';
import 'package:handy_man/utils/screen_size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:handy_man/components/buttons/custom_button.dart';

class SubscriptionHourly extends StatelessWidget {
  const SubscriptionHourly({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: context.heightPercent(10.0),
          right: context.widthPercent(10.0),
          left: context.widthPercent(10.0),
          bottom: context.heightPercent(16.0),
        ),
        child: Center(
          child: Column(
            children: [
              SvgPicture.asset('assets/icons/subscriptionHourly.svg'),
              SizedBox(
                height: context.heightPercent(14.0),
              ),
              const Text(
                "10 hours",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: context.heightPercent(10.0),
              ),
              const Text(
                "Get services with less charge and make your order successful",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: context.heightPercent(15.0),
              ),
              CustomButton(
                labelText: "Оформить подписку",
                height: context.heightPercent(38.0),
                onPress: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
