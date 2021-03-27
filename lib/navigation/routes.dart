import 'package:flutter/material.dart';
import 'package:mindxtalk/screens/screens.dart';

class Routes {
  static final Map<String, WidgetBuilder> routes = {
    Routes.splash: (BuildContext context) => SplashScreen(),
    Routes.login: (BuildContext context) => LoginScreen(),
  };

  static const String splash = '';
  static const String home = 'home';
  static const String login = 'login';
}
