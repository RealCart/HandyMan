import 'package:flutter/material.dart';
import '../utils/screen_size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsOptions extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const SettingsOptions({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: context.heightPercent(4.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            SvgPicture.asset("assets/icons/settings_options_arrow.svg")
          ],
        ),
      ),
    );
  }
}
