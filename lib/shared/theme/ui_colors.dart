import 'package:flutter/material.dart';

class UIColors {
  static Color titleColor(BuildContext context) {
    return Theme.of(context).textTheme.caption?.color ?? Colors.grey.shade500;
  }

  static Color captionColor(BuildContext context) {
    return Theme.of(context).textTheme.caption?.color ?? Colors.grey.shade500;
  }
}
