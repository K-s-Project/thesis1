import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/constants/defaults.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController? controller;
  final Widget? prefix;
  final Widget? suffix;
  final String hint;
  final String? Function(String?)? validator;
  final bool? obscure;
  final TextInputType? keyboard;
  final GlobalKey<FormState>? formKey;
  final double? radius;
  final Color? borderColor;
  final Color? bgColor;
  final bool lastTextField;
  final int? maxLength;
  final Widget? label;
  final TextInputAction? action;
  final bool readOnly;
  final String? initialValue;
  final Function(String)? onChanged;
  final bool expands;
  final int? maxLines;
  final int? minLines;
  final EdgeInsetsGeometry? padding;
  const CustomTextfield(
    this.hint, {
    Key? key,
    this.controller,
    this.prefix,
    this.suffix,
    this.validator,
    this.obscure,
    this.keyboard,
    this.formKey,
    this.radius,
    this.borderColor,
    this.bgColor,
    this.lastTextField = false,
    this.maxLength,
    this.action,
    this.label,
    this.readOnly = false,
    this.initialValue,
    this.onChanged,
    this.expands = false,
    this.maxLines,
    this.minLines,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: TextFormField(
        expands: expands,
        textInputAction: action,
        controller: controller,
        obscureText: obscure ?? false,
        keyboardType: keyboard,
        maxLength: maxLength,
        readOnly: readOnly,
        initialValue: initialValue,
        onChanged: onChanged,
        maxLines: maxLines,
        minLines: minLines,
        onEditingComplete: () {
          if (lastTextField) {
            node.unfocus();
          }
          {
            node.nextFocus();
          }
        },
        decoration: InputDecoration(
          contentPadding: padding ?? EdgeInsets.all(1.h),
          prefixIcon: prefix,
          hintText: hint,
          label: label,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor ?? Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(radius ?? DEFAULT_RADIUS),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: borderColor ?? Theme.of(context).primaryColor,
            ),
            borderRadius: BorderRadius.circular(radius ?? DEFAULT_RADIUS),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor ?? Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(radius ?? DEFAULT_RADIUS),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(radius ?? DEFAULT_RADIUS),
          ),
          filled: true,
          fillColor: bgColor ?? Colors.grey.shade200,
          suffixIcon: suffix,
        ),
        validator: validator,
      ),
    );
  }
}
