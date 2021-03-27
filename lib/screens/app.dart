import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:mindxtalk/bloc/bloc.dart';
import 'package:mindxtalk/bloc/config/config_bloc.dart';
import 'package:mindxtalk/injection/injection.dart';
import 'package:mindxtalk/l10n/l10n.dart';
import 'package:mindxtalk/navigation/navigator_util.dart';
import 'package:mindxtalk/navigation/routes.dart';
import 'package:mindxtalk/shared/shared.dart';
import 'package:mindxtalk/shared/utils/utils.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final _configBloc = getIt.get<ConfigBloc>();
  final _sessionBloc = getIt.get<SessionBloc>();

  @override
  void initState() {
    _configBloc.getInitialConfig();
    super.initState();
  }

  @override
  void dispose() {
    _configBloc.close();
    _sessionBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _sessionBloc,
      listener: _listenToSessionChange,
      child: BlocBuilder(
        bloc: _configBloc,
        builder: (context, state) {
          if (state is InitialConfigState) {
            return Container(color: Colors.white);
          }
          return _buildMaterialApp();
        },
      ),
    );
  }

  void _listenToSessionChange(BuildContext context, SessionState state) {
    if (state is SessionExpired) {
      Utils.showCustomDialog(context,
          title: 'Session Expire',
          description:
              'Your session is expired. Please log in again to continue.',
          onTapConfirm: () => NavigatorUtil.popToLoginScreen(context));
    }
  }

  MaterialApp _buildMaterialApp() {
    return MaterialApp(
      title: Constants.APP_TITLE,
      theme: getIt.get<AppTheme>().getTheme(context),
      initialRoute: '',
      localizationsDelegates: [
        L10n.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: L10n.delegate.supportedLocales,
      routes: Routes.routes,
    );
  }
}
