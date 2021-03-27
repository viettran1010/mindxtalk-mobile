import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mindxtalk/navigation/routes.dart';

class SlideUpRoute<T> extends PageRouteBuilder<T> {
  final Widget widget;

  @override
  bool get opaque => false;

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  SlideUpRoute(this.widget)
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              widget,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeUpwardsPageTransitionsBuilder().buildTransitions(
                  null, context, animation, secondaryAnimation, child),
        );

  @override
  Duration get transitionDuration => Duration(milliseconds: 300);
}

class SlideRightRoute<T> extends PageRouteBuilder<T> {
  final Widget widget;

  SlideRightRoute(this.widget)
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              widget,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}

class SlideBottomRoute<T> extends PageRouteBuilder<T> {
  final Widget widget;
  final String routeName;

  SlideBottomRoute(this.widget, this.routeName)
      : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              widget,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.0, 1.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}

class FadeRoute<T> extends PageRouteBuilder<T> {
  final Widget widget;

  FadeRoute(this.widget)
      : super(
            pageBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) =>
                widget,
            transitionsBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child) =>
                FadeTransition(
                  opacity: animation,
                  child: child,
                ));
}

class ScaleRoute<T> extends PageRouteBuilder<T> {
  final Widget widget;

  ScaleRoute(this.widget)
      : super(pageBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) {
          return widget;
        }, transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) {
          return ScaleTransition(
            scale: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Interval(
                  0.00,
                  0.50,
                ),
              ),
            ),
            child: ScaleTransition(
              scale: Tween<double>(
                begin: 1.3,
                end: 1.0,
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Interval(0.50, 1.00, curve: Curves.easeInOut),
                ),
              ),
              child: FadeTransition(
                opacity: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                    parent: animation, curve: Interval(0.4, 0.6))),
                child: child,
              ),
            ),
          );
        });
}

class TransparentRoute<T> extends PageRoute<T> {
  TransparentRoute({
    @required this.builder,
    RouteSettings? settings,
  })  : assert(builder != null),
        super(settings: settings, fullscreenDialog: false);

  final WidgetBuilder? builder;

  @override
  bool get opaque => false;

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => Duration(milliseconds: 50);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    final result = builder!(context);
    return FadeTransition(
      opacity: Tween<double>(begin: 0, end: 1).animate(animation),
      child: Semantics(
        scopesRoute: true,
        explicitChildNodes: true,
        child: result,
      ),
    );
  }
}

void popToHome(context) {
  Navigator.of(context).popUntil(ModalRoute.withName(Routes.home));
}

Future navigateTo(Widget screen, BuildContext context, {bool cuper = false}) {
  if (cuper) {
    return Navigator.push(
        context, CupertinoPageRoute(builder: (context) => screen));
  }
  return Navigator.push(
      context, MaterialPageRoute(builder: (context) => screen));
}

Future popUp(Widget screen, BuildContext context) {
  return Navigator.push(context, SlideUpRoute(screen));
}
