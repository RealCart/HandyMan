import 'package:flutter/material.dart';
import 'package:handy_man/presentation/horizontal_category_list.dart';

class Sectionsheader extends StatelessWidget {
  final String title;
  final String actionTitle;
  final VoidCallback onPressed;
  final List<Map<String, dynamic>> horizontalCategoryList;

  const Sectionsheader({
    super.key,
    required this.title,
    required this.actionTitle,
    required this.onPressed,
    required this.horizontalCategoryList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            InkWell(
              onTap: onPressed,
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              child: Text(
                actionTitle,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 10.0),
        Horizontalcategorylist(
          categories: List.generate(
            horizontalCategoryList.length,
            (int index) {
              return CategoryItem(
                assetName: "assets/images/mechanic.png",
                label: horizontalCategoryList[index]['name'],
              );
            },
          ),
        ),
        const SizedBox(height: 20.0),
      ],
    );
  }
}
