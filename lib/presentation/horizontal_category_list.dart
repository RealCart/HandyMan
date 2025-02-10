import 'package:flutter/material.dart';
import '../../utils/screen_size_extension.dart';

class Horizontalcategorylist extends StatelessWidget {
  const Horizontalcategorylist({
    super.key,
    required this.categories,
  });

  final List<CategoryItem> categories;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: categories
                .map(
                  (category) => CategoryCart(
                    assetName: category.assetName,
                    label: category.label,
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

class CategoryCart extends StatelessWidget {
  final String label;
  final String assetName;

  const CategoryCart({
    super.key,
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
          onTap: () {},
          child: SizedBox(
            width: context.widthPercent(82.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    assetName,
                    width: context.widthPercent(38.0),
                    height: context.heightPercent(38.0),
                  ),
                  Text(
                    label,
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryItem {
  final String assetName;
  final String label;

  CategoryItem({
    required this.assetName,
    required this.label,
  });
}
