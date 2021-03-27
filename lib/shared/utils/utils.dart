import 'dart:async';
import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:mindxtalk/shared/shared.dart';
import 'package:mindxtalk/shared/theme/ui_textstyle.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

final logger = Logger(printer: PrettyPrinter());

class Utils {
// Check if phone is connected to internet or not using StreamController
  Future<bool> hasConnection() async {
    try {
      final result = await InternetAddress.lookup("google.com");
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
      return false;
    } on SocketException catch (_) {
      return false;
    }
  }

  shareOthers(BuildContext context, url, {String subject = ""}) {
    final size = MediaQuery.of(context).size;
    final width = size.width / 2.0;
    final height = size.height / 2.0;
    Share.share(
      url,
      subject: subject,
      sharePositionOrigin: Rect.fromCenter(
        center: Offset(width, height * 2),
        width: width,
        height: height,
      ),
    );
  }

  launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }

  static void showFlushbar(BuildContext context, String message,
      {isSuccess = true}) {
    Future.delayed(
      Duration(milliseconds: 100),
      () => Flushbar(
        duration: Duration(seconds: 3),
        backgroundColor: isSuccess ? Colors.green : Colors.orange,
        flushbarPosition: FlushbarPosition.TOP,
        messageText: Text(message, style: UITextStyle.bodyStyle(context)),
      )..show(context),
    );
  }

  static Future<T?> showCustomDialog<T>(BuildContext context,
      {String? title, String? description, VoidCallback? onTapConfirm}) {
    return showDialog<T>(
      context: context,
      builder: (context) {
        return Center(
          child: Container(
            width: 300,
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Material(
                  child: Text(
                    title ?? 'Confirm',
                    style: UITextStyle.bodyStyle(context),
                    textAlign: TextAlign.center,
                  ),
                ),
                Material(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextButton(
                          onPressed: onTapConfirm,
                          child: Text(
                            "Yes",
                            style: UITextStyle.buttonStyle(context),
                          )),
                      TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text(
                            "No",
                            style: UITextStyle.buttonStyle(context),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  getFile(context, {onTap}) async {
    Navigator.of(context, rootNavigator: true).pop();
    FilePickerResult? file = await FilePicker.platform.pickFiles();
    if (file != null) {
      onTap();
    } else {
      showFlushbar(context, "No document selected", isSuccess: false);
    }
  }
}

class TextFieldValidators {
  static String? validateNonNull(String text) {
    return text.isEmpty ? "" : null;
  }

  static String? validatePriceAndTime(String text) {
    try {
      int check = double.parse(text).floor();
      return check > 0 ? null : "";
    } catch (e) {
      return "";
    }
  }

  static String? validatePhoneNumber(String text) {
    if (text.length < 10) {
      return "";
    }
    return null;
  }

  static String? validateEmail(String text) {
    RegExp regExp = RegExp(r"\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b",
        caseSensitive: false);
    if (regExp.hasMatch(text)) {
      return null;
    }
    return "";
  }
}
