import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:mindxtalk/injection/injection.dart';
import 'package:mindxtalk/repository/local_cache.dart';
import 'package:mindxtalk/shared/shared.dart';

part 'config_event.dart';

part 'config_state.dart';

@singleton
class ConfigBloc extends Bloc<ConfigEvent, ConfigState> {
  ConfigBloc() : super(InitialConfigState());

  void getInitialConfig() => add(GetInitialConfig());

  void updateThemeConfig(ThemeConfig theme) => add(UpdateThemeConfig(theme));

  @override
  Stream<ConfigState> mapEventToState(ConfigEvent event) async* {
    final _localCache = getIt.get<LocalCache>();
    if (event is GetInitialConfig) {
      final data = await _localCache.getString(_localCache.keyTheme) ??
          EnumToString.convertToString(ThemeConfig.light);
      final ThemeConfig theme =
          EnumToString.fromString(ThemeConfig.values, data) ??
              ThemeConfig.light;
      yield InitialConfigFetched(theme);
    } else if (event is UpdateThemeConfig) {
      yield ThemeConfigUpdated(event.theme);
    }
  }
}
