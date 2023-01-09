import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptableTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool readOnly;
  final void Function()? onSubmitted;
  final TextInputAction? textInputAction;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final void Function()? onTap;
  final Icon? suffixIcon;

  const AdaptableTextField({
    super.key,
    required this.controller,
    required this.label,
    this.onSubmitted,
    this.textInputAction,
    this.decoration,
    this.keyboardType,
    this.onTap,
    this.suffixIcon,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return Padding(
        padding: EdgeInsets.only(bottom: 15),
        child: CupertinoTextField(
          textInputAction: textInputAction,
          keyboardType: keyboardType,
          onSubmitted: (value) => onSubmitted!(),
          controller: controller,
          placeholder: label,
          onTap: onTap,
          suffix: suffixIcon,
          padding: EdgeInsets.symmetric(
            horizontal: 6,
            vertical: 12,
          ),
          readOnly: readOnly,
        ),
      );
    }
    return TextField(
      controller: controller,
      onSubmitted: (_) => onSubmitted!(),
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      onTap: onTap,
      readOnly: readOnly,
      decoration: decoration != null
          ? decoration!.copyWith(
              label: Text(label),
              suffixIcon: suffixIcon,
            )
          : InputDecoration(
              label: Text(label),
              suffixIcon: suffixIcon,
            ),
    );
  }
}
