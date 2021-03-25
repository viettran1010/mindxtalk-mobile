import 'package:flutter/material.dart';
import 'package:mindxtalk/injection/injection.dart';
import 'package:mindxtalk/screens/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await inject();
  runApp(App());
}
