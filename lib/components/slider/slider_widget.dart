import 'package:flutter/material.dart';

class CustomValueIndicatorShape extends SliderComponentShape {
  final double borderRadius;

  final double horizontalPadding;
  final double verticalPadding;

  final double verticalOffset;

  CustomValueIndicatorShape({
    this.borderRadius = 8,
    this.horizontalPadding = 8,
    this.verticalPadding = 4,
    this.verticalOffset = 32,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return const Size(0, 0);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final canvas = context.canvas;

    if (labelPainter.text == null) {
      return;
    }

    final textWidth = labelPainter.width;
    final textHeight = labelPainter.height;
    final totalWidth = textWidth + horizontalPadding * 2;
    final totalHeight = textHeight + verticalPadding * 2;
    final tooltipRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        center.dx - totalWidth / 2,
        center.dy - totalHeight - verticalOffset,
        totalWidth,
        totalHeight,
      ),
      Radius.circular(borderRadius),
    );

    final paint = Paint()
      ..color = sliderTheme.valueIndicatorColor ?? Colors.blue
      ..style = PaintingStyle.fill;
    canvas.drawRRect(tooltipRect, paint);
    final textOffset = Offset(
      center.dx - (textWidth / 2),
      center.dy - totalHeight - verticalOffset + verticalPadding,
    );
    labelPainter.paint(canvas, textOffset);
  }
}

class SliderWidget extends StatefulWidget {
  const SliderWidget({
    super.key,
    required this.initialValue,
    required this.onChanged,
  });

  final double initialValue;
  final void Function(double)? onChanged;

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
        valueIndicatorShape: CustomValueIndicatorShape(
          borderRadius: 5,
          horizontalPadding: 10,
          verticalPadding: 2,
          verticalOffset: 12,
        ),
        overlayShape: const RoundSliderOverlayShape(overlayRadius: 0.0),
        showValueIndicator: ShowValueIndicator.always,
      ),
      child: Slider(
        value: widget.initialValue,
        max: 9000,
        min: 40,
        activeColor: const Color(0xffF1C40F),
        inactiveColor: const Color.fromRGBO(254, 211, 125, 0.33),
        divisions: 900,
        label: widget.initialValue.round().toString(),
        onChanged: widget.onChanged,
      ),
    );
  }
}
