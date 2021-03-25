part of 'config_bloc.dart';

@immutable
abstract class ConfigState {}

class InitialConfigState extends ConfigState {}

class InitialConfigFetched extends ConfigState {
  final ThemeConfig theme;

  InitialConfigFetched(this.theme);
}

class ThemeConfigUpdated extends ConfigState {
  final ThemeConfig theme;

  ThemeConfigUpdated(this.theme);
}
