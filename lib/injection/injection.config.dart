// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../bloc/config/config_bloc.dart' as _i4;
import '../repository/local_cache.dart' as _i6;
import '../shared/environment.dart' as _i5;
import '../shared/theme/theme.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.AppTheme>(_i3.AppTheme());
  gh.singleton<_i4.ConfigBloc>(_i4.ConfigBloc());
  gh.singleton<_i5.Environment>(_i5.Environment());
  gh.singleton<_i6.LocalCache>(_i6.LocalCache());
  return get;
}
