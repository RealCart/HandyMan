import 'package:flutter/material.dart';
import '../../models/bottom_nav_item_data.dart';
import '../../utils/screen_size_extension.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onItemSelected;
  final List<BottomNavItemData> items;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onItemSelected,
    required this.items,
  });

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  static const double _indicatorWidth = 67.0;
  static const double _barHeight = 60.0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final segmentWidth =
        (screenWidth - context.widthPercent(8.0) * 2) / widget.items.length;
    final leftPosition = segmentWidth * widget.currentIndex +
        (segmentWidth - _indicatorWidth) / 2;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.widthPercent(8.0),
        ),
        child: Container(
          height: _barHeight,
          decoration: const BoxDecoration(
            color: Colors.transparent,
            border: Border(
              top: BorderSide(color: Color(0xff8C8888), width: 1),
            ),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  widget.items.length,
                  (index) {
                    final item = widget.items[index];
                    final isActive = (index == widget.currentIndex);

                    return Expanded(
                      child: GestureDetector(
                          onTap: () => widget.onItemSelected(index),
                          child: Container(
                            height: 60,
                            color: Colors.transparent,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  item.icon,
                                  color: isActive ? Colors.black : Colors.grey,
                                ),
                                Text(
                                  item.label,
                                  style: TextStyle(
                                    color:
                                        isActive ? Colors.black : Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          )),
                    );
                  },
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                left: leftPosition,
                top: -1.5,
                child: Container(
                  width: _indicatorWidth,
                  height: 2,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
