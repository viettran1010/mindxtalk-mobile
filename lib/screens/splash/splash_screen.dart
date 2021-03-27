import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Image.asset("assets/images/logo.png"),
      ),
    );
  }

  _startTimer() async {
    await Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushNamed('login');
    });
  }
}
