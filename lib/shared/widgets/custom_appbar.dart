import 'package:flutter/material.dart';
import 'package:mindxtalk/injection/injection.dart';
import 'package:mindxtalk/shared/shared.dart';

mixin AppBarEco on PreferredSizeWidget {
  @override
  get preferredSize => Size.fromHeight(53);
}

class AppBarCustom extends AppBar with AppBarEco {
  AppBarCustom(
      {required BuildContext context,
      TextStyle? style,
      dynamic title,
      List<Widget>? actions,
      Stream<bool>? loadingStream,
      bool automaticallyImplyLeading = true,
      Color? backgroundColor,
      double elevation = 1.0,
      double titleSpacing = NavigationToolbar.kMiddleSpacing,
      IconThemeData? iconTheme,
      Brightness? brightness,
      Function? backPage,
      Widget? leading,
      Widget? divider,
      bool showDivider = false,
      Color? titleColor,
      Color? shadowColor})
      : super(
            title: title is String
                ? Text(title, style: UITextStyle.titleStyle(context))
                : title,
            centerTitle: true,
            titleSpacing: titleSpacing,
            brightness: brightness ??
                (getIt.get<AppTheme>().theme == ThemeConfig.light
                    ? Brightness.light
                    : Brightness.dark),
            backgroundColor: backgroundColor,
            elevation: elevation,
            bottomOpacity: 1.0,
            actions: actions,
            iconTheme: iconTheme,
            bottom: PreferredSize(
              child: loadingStream != null
                  ? StreamBuilder<bool>(
                      stream: loadingStream,
                      initialData: false,
                      builder: (context, snapshot) => (snapshot.data ?? false)
                          ? Container(
                              height: 1, child: LinearProgressIndicator())
                          : Container(
                              height: 0.5,
                              color: Colors.grey,
                            ),
                    )
                  : divider ?? Container(),
              preferredSize: loadingStream != null
                  ? Size.fromHeight(1)
                  : Size.fromHeight(1),
            ),
            automaticallyImplyLeading: automaticallyImplyLeading,
            leading: backPage != null
                ? InkWell(
                    onTap: () => backPage(),
                    child: Icon(
                      Icons.arrow_back,
                      size: 24,
                    ),
                  )
                : leading,
            shadowColor: (getIt.get<AppTheme>().theme == ThemeConfig.light
                ? null
                : Colors.white));
}
