import 'package:flutter/material.dart';
import '../../utils/screen_size_extension.dart';
import 'package:pinput/pinput.dart';

class CustomPinInput extends StatefulWidget {
  final int length;
  final ValueChanged<String>? onCompleted;
  final ValueChanged<String>? onChanged;

  const CustomPinInput({
    super.key,
    this.length = 4,
    this.onCompleted,
    this.onChanged,
  });

  @override
  State<CustomPinInput> createState() => _PinInputState();
}

class _PinInputState extends State<CustomPinInput> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: context.widthPercent(49.0),
      height: context.heightPercent(42.0),
      textStyle: const TextStyle(
        fontSize: 16,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xffE5F3FC),
      ),
    );

    return Pinput(
      length: widget.length,
      controller: _controller,
      onCompleted: widget.onCompleted,
      onChanged: widget.onChanged,
      defaultPinTheme: defaultPinTheme,
      showCursor: true,
      cursor: Container(
        width: 2,
        height: 24,
        color: Colors.black,
      ),
    );
  }
}
