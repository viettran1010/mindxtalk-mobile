import 'package:flutter/material.dart';
import 'package:mindxtalk/screens/screens.dart';

final Map<String, WidgetBuilder> routes = {
  '': (BuildContext context) => SplashScreen(),
  'login': (BuildContext context) => LoginScreen(),
};
