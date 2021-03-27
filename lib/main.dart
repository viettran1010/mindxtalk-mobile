import 'package:flutter/material.dart';
import 'package:mindxtalk/injection/injection.dart';
import 'file:///F:/Workspace/Github/NEW/mindxtalk/lib/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await inject();
  runApp(App());
}
