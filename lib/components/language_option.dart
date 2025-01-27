import 'package:flutter/material.dart';
import '../utils/screen_size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LanguageOption extends StatelessWidget {
  final String label;
  final String subTitle;
  final VoidCallback onTap;
  const LanguageOption({
    super.key,
    required this.label,
    required this.subTitle,
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
            Row(
              children: [
                Text(
                  subTitle,
                  style: const TextStyle(
                    color: Color(0xff9A9A9A),
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  width: context.widthPercent(8.0),
                ),
                SvgPicture.asset("assets/icons/settings_options_arrow.svg")
              ],
            )
          ],
        ),
      ),
    );
  }
}
