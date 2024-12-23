import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/screen_size_extension.dart';

class Horizontalcategorylist extends StatelessWidget {
  final List<CategoryItem> categories;
  const Horizontalcategorylist({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories
            .map(
              (category) => CategoryCart(
                onPressed: category.onPressed,
                assetName: category.assetName,
                label: category.label,
              ),
            )
            .toList(),
      ),
    );
  }
}

class CategoryCart extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final String assetName;

  const CategoryCart({
    super.key,
    required this.onPressed,
    required this.assetName,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: context.widthPercent(8.0)),
      child: Material(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onPressed,
          child: SizedBox(
            height: context.heightPercent(80.0),
            width: context.widthPercent(82.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(assetName),
                Text(
                  label,
                  style: const TextStyle(fontSize: 15, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryItem {
  final VoidCallback onPressed;
  final String assetName;
  final String label;

  CategoryItem({
    required this.onPressed,
    required this.assetName,
    required this.label,
  });
}
