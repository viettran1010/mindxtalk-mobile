import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mindxtalk/bloc/config/config_bloc.dart';
import 'package:mindxtalk/injection/injection.dart';
import 'package:mindxtalk/l10n/l10n.dart';
import 'package:mindxtalk/routes.dart';
import 'package:mindxtalk/shared/shared.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final _appTheme = getIt.get<AppTheme>();
  final _configBloc = getIt.get<ConfigBloc>();

  @override
  void initState() {
    _configBloc.getInitialConfig();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: _configBloc,
        builder: (context, state) {
          if (state is InitialConfigState) {
            return Container(color: Colors.white);
          }
          if (state is InitialConfigFetched) {
            _appTheme.theme = state.theme;
          } else if (state is ThemeConfigUpdated) {
            _appTheme.theme = state.theme;
          }
          return MaterialApp(
            title: Constants.APP_TITLE,
            theme: _appTheme.getTheme(),
            initialRoute: '',
            localizationsDelegates: [
              L10n.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: L10n.delegate.supportedLocales,
            routes: routes,
          );
        });
  }
}
