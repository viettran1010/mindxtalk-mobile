import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mindxtalk/shared/shared.dart';
export 'ui_colors.dart';
export 'ui_textstyle.dart';

enum ThemeConfig { light, dark }

@singleton
class AppTheme {
  ThemeConfig theme = ThemeConfig.light;

  ThemeData getTheme(BuildContext context) {
    if (theme == ThemeConfig.light) {
      return _getThemeDataLight(context);
    }
    return _getThemeDataDark(context);
  }

  void setTheme(ThemeConfig selectedTheme) {
    theme = selectedTheme;
  }

  ThemeData _getThemeDataLight(BuildContext context) {
    return ThemeData.light().copyWith(
      textTheme: ThemeData.light().textTheme.copyWith(
          headline4: ThemeData.light()
              .textTheme
              .headline4
              ?.copyWith(color: Colors.black)),
      primaryColor: Color(0xFF097AD3),
      accentColor: const Color(0xFF0095DE),
      canvasColor: Colors.white,
      buttonColor: const Color(0XFF097AD3),
      cardColor: Colors.white,
      toggleableActiveColor: const Color(0xFF2F80ED),
      errorColor: Colors.redAccent,
      backgroundColor: Color(0xFFF7F7F7),
      primaryIconTheme:
          Theme.of(context).iconTheme.copyWith(color: const Color(0xFF9C9C9C)),
      indicatorColor: Color(0xFF565656),
      iconTheme:
          Theme.of(context).iconTheme.copyWith(color: const Color(0xFF9C9C9C)),
      scaffoldBackgroundColor: Color(0xFFF4F4F4),
      dividerColor: Color(0xFFDFDFDF),
      bottomAppBarColor: Color(0xFFE5E5E5),
      disabledColor: Colors.grey[400],
      accentTextTheme: Theme.of(context).accentTextTheme.copyWith(
          subtitle2: TextStyle(color: Colors.black87),
          headline6: TextStyle(color: const Color(0xFF1890FF))),
      tabBarTheme: Theme.of(context).tabBarTheme.copyWith(
            labelColor: Color(0xff7344D9),
            labelStyle: Theme.of(context).textTheme.bodyText2,
            unselectedLabelStyle: Theme.of(context).textTheme.bodyText2,
            unselectedLabelColor: Color(0xFF565656),
            indicatorSize: TabBarIndicatorSize.tab,
          ),
      appBarTheme: AppBarTheme(
          color: ThemeData.light().cardColor,
          textTheme: ThemeData.light().textTheme.copyWith(
                subtitle1:
                    UITextStyle.titleBoldStyle(context, color: Colors.black),
              ),
          actionsIconTheme: IconThemeData(color: Color(0xFF097AD3)),
          iconTheme: IconThemeData(color: Color(0xFF097AD3))),
      colorScheme: ColorScheme.light().copyWith(
        secondary: Color(0xFF0095DE),
        onSecondary: Color(0xFF6AA4D2),
        background: Color(0xFF2F6C9B),
        onPrimary: Colors.white,
        primary: Color(0xFF097AD3),
        onBackground: Color(0xFF0095DE),
        onSurface: Colors.black87,
        surface: Color(0xFFEDEDED),
      ),
    );
  }

  ThemeData _getThemeDataDark(BuildContext context) {
    return ThemeData.dark().copyWith(
      textTheme: ThemeData.dark().textTheme.copyWith(
          headline4: ThemeData.light()
              .textTheme
              .headline4
              ?.copyWith(color: Colors.white)),
      dividerColor: const Color(0xFF323232),
      accentColor: const Color(0xFF8A89A0),
      scaffoldBackgroundColor: Colors.black,
      cardColor: const Color(0xFF0A0A0A),
      primaryColor: const Color(0xFF1A1E2D),
      backgroundColor: const Color(0xFF171717),
      buttonColor: const Color(0xFF8A89A0),
      dividerTheme: DividerThemeData(color: const Color(0xFF373737)),
      toggleableActiveColor: const Color(0xFF925FFF),
      bottomAppBarColor: const Color(0xFF171717),
      appBarTheme: AppBarTheme(
        color: Color(0XFF171717),
        textTheme: ThemeData.dark().textTheme.copyWith(
              subtitle1:
                  UITextStyle.titleBoldStyle(context, color: Colors.white),
            ),
        actionsIconTheme: IconThemeData(color: Color(0xFF8A89A0)),
        iconTheme: IconThemeData(color: Color(0xFF8A89A0)),
      ),
      accentTextTheme: Theme.of(context).accentTextTheme.copyWith(
          subtitle2: TextStyle(color: const Color(0xFFFFC977)),
          headline6: TextStyle(color: Colors.white)),
      tabBarTheme: Theme.of(context).tabBarTheme.copyWith(
            labelColor: const Color(0xFFFFFFFF),
            labelStyle: Theme.of(context).textTheme.bodyText2,
            unselectedLabelColor: Color(0xFFB1B1B1),
            unselectedLabelStyle: Theme.of(context).textTheme.bodyText2,
            indicatorSize: TabBarIndicatorSize.tab,
          ),
      colorScheme: ColorScheme.dark().copyWith(
          secondary: Color(0xFF8A89A0),
          onSecondary: Colors.white,
          background: Colors.black,
          surface: Color(0xFF121212),
          onBackground: Colors.grey,
          onPrimary: Colors.white),
    );
  }
}
