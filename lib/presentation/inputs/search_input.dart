import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../utils/screen_size_extension.dart';

class SearchInput extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;

  const SearchInput({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: const Color(0XffD9D9D9),
      controller: widget.controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xffFFFFFF),
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          fontSize: 18,
          color: Color(0XffD9D9D9),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: context.widthPercent(20.0),
        ),
        suffixIcon: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/icons/search_filter.svg"),
        ),
        prefixIcon: const Icon(Icons.search_rounded),
      ),
    );
  }
}
