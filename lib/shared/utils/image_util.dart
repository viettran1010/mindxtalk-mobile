import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mindxtalk/shared/utils/utils.dart';

class ImageUtil {
  final ImagePickerListener? listener;
  final bool isCrop;
  bool isMultiple = false;
  final double? maxWidth;
  final double? maxHeight;
  final bool isSquare;

  ImageUtil({
    this.listener,
    this.isCrop = true,
    this.isSquare = false,
    this.isMultiple = false,
    this.maxWidth,
    this.maxHeight,
  });

  showImageDialog(context, {onTap}) async {
    await showDialog(
      context: context,
      builder: (context) => Center(
        child: Material(
          child: Container(
            // color: UIColors.nobel,
            width: 200,
            height: 300,
            child: Center(
              child: Column(
                children: <Widget>[
                  // UIButton(
                  //   width: 200,
                  //   height: 100,
                  //   label: "From Camera",
                  //   labelStyle: UITextStyle.poppins,
                  //   borderColor: Colors.grey,
                  //   onPressCallback: () =>
                  //       getImage(context, ImageSource.camera, onTap: onTap),
                  // ),
                  // UIButton(
                  //   width: 200,
                  //   height: 100,
                  //   label: "From Gallery",
                  //   labelStyle: UITextStyle.poppins,
                  //   borderColor: Colors.grey,
                  //   onPressCallback: () =>
                  //       getImage(context, ImageSource.gallery, onTap: onTap),
                  // ),
                  // UIButton(
                  //   width: 200,
                  //   height: 100,
                  //   label: "From File",
                  //   labelStyle: UITextStyle.poppins,
                  //   borderColor: Colors.grey,
                  //   onPressCallback: () => getFile(context, onTap: onTap),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  getImage(context, source,
      {onTap, defaultCameraDirection, allowVideo = false}) async {
    dynamic mediaContent = source == ImageSource.gallery
        ? await ImagePicker().getImage(source: source)
        : await showDialog(
            context: context, builder: (context) => Container()); //! TEMPORARY
    if (mediaContent != null) {
      final List<String> imagePathParts = mediaContent.path.split(".");
      if (imagePathParts.last == "mp4") {
        onTap();
      } else {
        try {
          var croppedImage = await _cropImage(mediaContent);
          if (croppedImage != null) {
            onTap();
          }
        } catch (e) {
          print(e);
        }
      }
    } else {
      Utils.showFlushbar(context, "No document selected", isSuccess: false);
    }
    Navigator.of(context, rootNavigator: true).pop();
  }

  Future<dynamic> _cropImage(PickedFile image) async {
    File? croppedFile = await ImageCropper.cropImage(
        sourcePath: image.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          title: 'Cropper',
        ));
    if (croppedFile != null) {
      return croppedFile;
    }
    return image;
  }
}

abstract class ImagePickerListener {
  onPicked(List<File> _images);

  onProcessing();

  onError(String message);
}
