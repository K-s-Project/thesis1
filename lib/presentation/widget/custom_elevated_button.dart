// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/constants/defaults.dart';
import 'custom_text.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  final double? height;
  final double? width;
  final Color? color;
  final Color? bgColor;
  final double? radius;
  final double? fontSize;
  final FontWeight? weight;
  const CustomElevatedButton(
    this.text, {
    Key? key,
    this.height,
    this.width,
    this.color,
    this.bgColor,
    this.radius,
    this.onPressed,
    this.fontSize,
    this.weight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        foregroundColor: MaterialStatePropertyAll(color ?? Colors.black),
        fixedSize: MaterialStatePropertyAll(
            Size(width ?? DEFAULT_BTN_WIDTH.w, DEFAULT_BTN_HEIGHT.h)),
        backgroundColor: MaterialStatePropertyAll(
            onPressed == null ? Colors.grey.shade200 : bgColor ?? Colors.white),
        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? DEFAULT_RADIUS))),
      ),
      child: CustomText(
        text,
        size: fontSize,
        weight: weight,
        color: onPressed == null ? Colors.grey : color ?? Colors.black,
      ),
    );
  }
}
