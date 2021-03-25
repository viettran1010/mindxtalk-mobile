import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

enum ThemeConfig { light, dark }

@singleton
class AppTheme {
  ThemeConfig theme = ThemeConfig.light;

  ThemeData getTheme() {
    if (theme == ThemeConfig.light) {
      return ThemeData.light();
    }
    return ThemeData.dark();
  }
}

class StyleApp {
  static Color getShimmerColor(BuildContext context) {
    return Colors.grey;
  }

  static double get fontSizeLarge => 17;

  static double get fontSizeMedium => 15;

  static double get fontSizeSmall => 13;

  static double get fontSizeTiny => 10;

  //- Dùng cho tiêu đề in đậm (Semi-bold)
  static TextStyle titleBoldStyle(BuildContext context,
      {double? fontSize, Color? color}) {
    if (fontSize == null) {
      fontSize = fontSizeLarge;
    }
    return StyleApp.baseStyle(context,
        fontWeight: FontWeight.w600, fontSize: fontSize, color: color);
  }

  //- Dùng cho tiêu đề kiểu Medium
  static TextStyle titleStyle(BuildContext context,
      {double? fontSize, Color? color}) {
    if (fontSize == null) {
      fontSize = fontSizeLarge;
    }
    return StyleApp.baseStyle(context,
        fontWeight: FontWeight.w500, fontSize: fontSize, color: color);
  }

  //- Dùng cho mô tả kiểu regular, màu giống title
  static TextStyle descStyle(BuildContext context,
      {double? fontSize,
      Color? color,
      FontWeight fontWeight = FontWeight.normal}) {
    if (fontSize == null) {
      fontSize = fontSizeMedium;
    }
    return StyleApp.baseStyle(context,
        fontWeight: fontWeight, fontSize: fontSize, color: color);
  }

  //- Dùng cho mô tả kiểu regular, màu nhạt
  static TextStyle bodyStyle(BuildContext context,
      {double? fontSize,
      Color? color,
      FontWeight fontWeight = FontWeight.normal}) {
    if (fontSize == null) {
      fontSize = fontSizeMedium;
    }
    return StyleApp.baseStyle(context,
        fontWeight: fontWeight,
        fontSize: fontSize,
        color:
            Theme.of(context).textTheme.caption?.color ?? Colors.grey.shade500);
  }

  //- Dùng cho caption kiểu regular, màu nhạt
  static TextStyle captionStyle(BuildContext context,
      {double? fontSize,
      Color? color,
      FontWeight fontWeight = FontWeight.normal}) {
    if (fontSize == null) {
      fontSize = fontSizeSmall;
    }
    return StyleApp.baseStyle(context,
        fontWeight: fontWeight,
        fontSize: fontSize,
        color:
            Theme.of(context).textTheme.caption?.color ?? Colors.grey.shade500);
  }

  //- Dùng cho text input
  static TextStyle textFieldStyle(BuildContext context,
      {double? fontSize,
      Color? color,
      FontWeight fontWeight = FontWeight.normal}) {
    if (fontSize == null) {
      fontSize = fontSizeLarge;
    }
    return StyleApp.baseStyle(context,
        fontWeight: fontWeight, fontSize: fontSize, color: color);
  }

  //- Dùng cho tiêu đề button
  static TextStyle buttonStyle(BuildContext context,
      {double? fontSize,
      Color? color,
      FontWeight fontWeight = FontWeight.w600}) {
    if (fontSize == null) {
      fontSize = fontSizeLarge;
    }
    return StyleApp.baseStyle(context,
        fontWeight: fontWeight, fontSize: fontSize, color: color);
  }

  //- Dùng cho tiêu đề của header
  static TextStyle headerStyle(BuildContext context,
      {double? fontSize,
      Color? color,
      FontWeight fontWeight = FontWeight.w500}) {
    final textColor =
        (color != null ? color : StyleApp.titleColor(context).withOpacity(0.8));
    if (fontSize == null) {
      fontSize = fontSizeMedium;
    }
    return StyleApp.baseStyle(context,
        fontWeight: fontWeight, fontSize: fontSize, color: textColor);
  }

  //- Dùng cho tiêu đề của setting
  static TextStyle settingStyle(BuildContext context,
      {double? fontSize, Color? color}) {
    if (fontSize == null) {
      fontSize = fontSizeLarge;
    }
    return StyleApp.baseStyle(context,
        fontWeight: FontWeight.normal, fontSize: fontSize, color: color);
  }

  //- Dùng cho tiêu đề của segment
  static TextStyle segmentStyle(BuildContext context,
      {double? fontSize, Color? color}) {
    if (fontSize == null) {
      fontSize = fontSizeSmall;
    }
    return StyleApp.baseStyle(context,
        fontWeight: FontWeight.normal, fontSize: fontSize, color: color);
  }

  //- Dùng cho text input money
  static TextStyle textMoneyStyle(BuildContext context,
      {double fontSize = 20,
      Color? color,
      FontWeight fontWeight = FontWeight.w600}) {
    return StyleApp.baseStyle(context,
        fontWeight: fontWeight, fontSize: fontSize, color: color);
  }

  static TextStyle baseStyle(BuildContext context,
      {Color? color,
      double fontSize = 17,
      FontWeight fontWeight = FontWeight.w500}) {
    return TextStyle()
        .copyWith(fontWeight: fontWeight, color: color, fontSize: fontSize);
  }

  static Color titleColor(BuildContext context) {
    return Theme.of(context).textTheme.caption?.color ?? Colors.grey.shade500;
  }

  static Color captionColor(BuildContext context) {
    return Theme.of(context).textTheme.caption?.color ?? Colors.grey.shade500;
  }
}
