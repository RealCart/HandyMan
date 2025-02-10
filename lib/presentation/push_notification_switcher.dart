import 'package:flutter/material.dart';
import 'package:handy_man/utils/screen_size_extension.dart';

class PushNotificationSwitcher extends StatefulWidget {
  final String label;

  const PushNotificationSwitcher({
    super.key,
    required this.label,
  });

  @override
  State<PushNotificationSwitcher> createState() =>
      _PushNotificationSwitcherState();
}

class _PushNotificationSwitcherState extends State<PushNotificationSwitcher> {
  bool initialValue = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        SizedBox(
          width: context.widthPercent(45.0),
          height: context.heightPercent(32.0),
          child: FittedBox(
            fit: BoxFit.fill,
            child: Switch(
              value: initialValue,
              inactiveTrackColor: Colors.white,
              activeTrackColor: Colors.white,
              trackOutlineColor: WidgetStateProperty.resolveWith<Color?>(
                  (Set<WidgetState> states) {
                return Colors.white;
              }),
              inactiveThumbColor: const Color(0xff33A3E8),
              activeColor: const Color(0xff33A3E8),
              onChanged: (bool value) {
                setState(() {
                  initialValue = value;
                });
              },
            ),
          ),
        )
      ],
    );
  }
}
