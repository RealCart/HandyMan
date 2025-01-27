import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:handy_man/utils/screen_size_extension.dart';
import '../components/buttons/custom_button.dart';

class FavoritesCard extends StatelessWidget {
  final String label;
  final String hours;

  const FavoritesCard({
    super.key,
    required this.label,
    required this.hours,
  });

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
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: context.heightPercent(5.0)),
                    Row(
                      children: [
                        SvgPicture.asset("assets/icons/clock_favorites.svg"),
                        SizedBox(width: context.widthPercent(5.0)),
                        Text(
                          "$hours часа",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                InkWell(
                  child: SvgPicture.asset(
                    "assets/icons/favorites_delete_icon.svg",
                  ),
                  onTap: () {},
                ),
              ],
            ),
            SizedBox(height: context.heightPercent(10.0)),
            CustomButton(
              labelText: "Book now",
              height: context.heightPercent(39.0),
              onPress: () {},
            ),
          ],
        ),
      ),
    );
  }
}
