import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mindxtalk/shared/shared.dart';

const testImage200 = 'https://via.placeholder.com/200/0090FF/FFFFFF';

class BackgroundApp extends StatelessWidget {
  final Widget? child;
  final Color? color;

  // final Stream<NetworkStatus> networkStream;
  final Widget? backgroundWidget;

  const BackgroundApp({
    Key? key,
    @required this.child,
    // this.networkStream,
    this.color,
    this.backgroundWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // backgroundWidget != null ? backgroundWidget : Container(),
        child!,
        // networkStream != null
        //     ? StreamBuilder<NetworkStatus>(
        //         stream: networkStream,
        //         builder: (context, snapshot) {
        //           if (snapshot.hasData && snapshot.data == NetworkStatus.none) {
        //             return Material(
        //               child: Container(
        //                 padding: EdgeInsets.only(bottom: 10),
        //                 child: Row(
        //                   mainAxisAlignment: MainAxisAlignment.center,
        //                   crossAxisAlignment: CrossAxisAlignment.center,
        //                   children: <Widget>[
        //                     Text(S.of(context).disconnect),
        //                   ],
        //                 ),
        //                 alignment: Alignment.bottomCenter,
        //                 color: Theme.of(context).errorColor,
        //                 height: 66,
        //               ),
        //             );
        //           }
        //           return Container();
        //         })
        //     : Container()
      ],
    );
  }
}

class BackgroundImage extends StatelessWidget {
  final Widget? child;
  final AppBar? appBar;
  final bool resizeToAvoidBottomInset;

  BackgroundImage(
      {this.child, this.appBar, this.resizeToAvoidBottomInset = true});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundWidget(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: appBar,
          body: child,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        )
      ],
    );
  }
}

class BackgroundWidget extends StatelessWidget {
  final Widget? child;

  BackgroundWidget({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned.fill(
              child: FittedBox(
                  fit: BoxFit.cover, child: SvgPicture.asset(ImageAssets.icApp))),
          Positioned(
              left: 0, right: 0, top: 0, bottom: 0, child: child ?? Container())
        ],
      ),
    );
  }
}
