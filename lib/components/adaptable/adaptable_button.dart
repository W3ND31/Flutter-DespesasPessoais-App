import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptableButton extends StatelessWidget {
  final void Function() onPressed;
  final Widget child;
  final Color? textColor;

  const AdaptableButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoButton(
        onPressed: onPressed,
        color: textColor,
        child: child,
      );
    }
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          textStyle: TextStyle(
        color: textColor,
      )),
      // textColor: textColor,
      child: child,
    );
  }
}
