import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:mindxtalk/injection/injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> inject() async => $initGetIt(getIt);
