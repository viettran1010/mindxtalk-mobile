import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mindxtalk/navigation/routes.dart';
import 'package:mindxtalk/navigation/navigator_animation.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class NavigatorUtil {
  Future popUp<T extends Object>(Widget screen, BuildContext context) {
    return Navigator.push(context, SlideUpRoute(screen));
  }

  static popToLoginScreen(context) {
    return Navigator.popUntil(context, ModalRoute.withName(Routes.login));
  }

  static Future popUpPage<T extends Object>(
    Widget screen,
    BuildContext context, {
    String? routeName,
    bool replace = false,
  }) {
    if (replace) {
      return Navigator.pushReplacement(
          context, SlideBottomRoute(screen, routeName!));
    }
    return Navigator.push<T>(context, SlideBottomRoute(screen, routeName!));
  }

  popToPageWithRoute(BuildContext context, {String? route}) {
    Navigator.popUntil(context, ModalRoute.withName(route ?? Routes.home));
  }

  popUntilWithRoute(context, String routeName) {
    return Navigator.popUntil(context, ModalRoute.withName(routeName));
  }

  Future<T?> replace<T extends Object>(
      BuildContext context, Widget page, String name,
      {dynamic result}) {
    return Navigator.pushReplacement(context, pageRoute(page, route: name),
        result: result);
  }

  Future<T?> goTrans<T extends Object>(BuildContext context, Widget page) {
    return Navigator.push(
        context, TransparentRoute(builder: (BuildContext context) => page));
  }

  Future<T?> go<T extends Object>(BuildContext context, Widget page,
      {bool cuper = true}) {
    if (cuper)
      return Navigator.push(
          context, CupertinoPageRoute(builder: (context) => page));
    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => page));
  }

  Future<T?> goWithRoute<T extends Object>(
      BuildContext context, Widget page, String router,
      {bool cuper = true}) {
    if (cuper)
      return Navigator.push(
          context,
          CupertinoPageRoute(
              builder: (context) => page,
              settings: RouteSettings(name: router)));
    return Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => page, settings: RouteSettings(name: router)));
  }

  pageRoute(page, {String? route, bool cuper = true}) {
    return cuper
        ? CupertinoPageRoute(
            builder: (context) => page, settings: RouteSettings(name: route))
        : MaterialPageRoute(
            builder: (context) => page, settings: RouteSettings(name: route));
  }

  Future<T?> goPresent<T extends Object>(BuildContext context, Widget page) {
    return showMaterialModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => page,
    );
  }
}
