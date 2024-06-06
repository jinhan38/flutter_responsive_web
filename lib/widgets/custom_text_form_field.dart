import 'package:flutter/material.dart';
import 'package:flutter_responsive_web/util/my_color.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    required this.controller,
    required this.textInputType,
    required this.hintText,
    this.maxLines = 1,
    this.textInputAction = TextInputAction.next,
    this.fontSize = 15,
    this.textHeight = 1,
    this.verticalPadding = 15,
    this.onFieldSubmitted,
    super.key,
  });

  final TextEditingController controller;
  final TextInputType textInputType;
  final int maxLines;
  final TextInputAction textInputAction;
  final double fontSize;
  final double textHeight;
  final String hintText;
  final double verticalPadding;
  final Function(String value)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      autofocus: false,
      controller: controller,
      keyboardType: maxLines > 1 ? TextInputType.multiline : textInputType,
      textInputAction: maxLines > 1 ? TextInputAction.newline : textInputAction,
      textAlignVertical: TextAlignVertical.center,
      cursorHeight: fontSize * textHeight,
      cursorColor: Colors.black,
      style: TextStyle(
        fontSize: fontSize,
        height: textHeight,
        color: MyColor.gray90,
        fontWeight: FontWeight.w500,
      ),
      onFieldSubmitted: (value) {
        onFieldSubmitted?.call(value);
      },
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
            fontSize: fontSize,
            height: textHeight,
            color: Colors.grey,
            fontWeight: FontWeight.w500),
        contentPadding:
            EdgeInsets.symmetric(horizontal: 20, vertical: verticalPadding),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide:
                BorderSide(width: 1, color: Colors.grey.withOpacity(0.5))),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(width: 1, color: Colors.black)),
      ),
    );
  }
}
