part of 'config_bloc.dart';

@immutable
abstract class ConfigEvent {}

class GetInitialConfig extends ConfigEvent {}

class UpdateThemeConfig extends ConfigEvent {
  final ThemeConfig theme;

  UpdateThemeConfig(this.theme);
}
