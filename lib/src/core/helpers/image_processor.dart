import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:pey/src/core/helpers/helpers.dart';

Future<String?> uploadSquare(ImageSource source) async {
  final image = await ImagePicker().pickImage(source: source);

  if (image != null) {
    final cropped = await ImageCropper().cropImage(
      sourcePath: image.path,
      compressQuality: 40,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
    );
    return cropped?.path;
  } else {
    return null;
  }
}

Future<XFile?> uploadVideo(ImageSource source) async {
  final video = await ImagePicker().pickVideo(source: source);
  pp(video!.path);
  return video;
}

Future<XFile?> uploadMedia() async {
  final media = await ImagePicker().pickMedia(imageQuality: 40);
  return media;
}

Future<String?> convertFileToB64({path}) async {
  File mediaFile = File(path);
  Uint8List imagebytes = await mediaFile.readAsBytes();
  String base64string = base64.encode(imagebytes);
  String? x = lookupMimeType(path);

  return "data:$x;base64,$base64string";
}

Future<List<Color>> processColorsFromImage({
  required ImageProvider imageProvider,
}) async {
  PaletteGenerator paletteGenerator;
  paletteGenerator = await PaletteGenerator.fromImageProvider(imageProvider);
  final Color dominantColor =
      paletteGenerator.dominantColor?.color ?? Colors.black;
  final Color darkMutedColor =
      paletteGenerator.darkMutedColor?.color ?? Colors.black;
  final Color lightMutedColor =
      paletteGenerator.lightMutedColor?.color ?? dominantColor;
  if (dominantColor.computeLuminance() < darkMutedColor.computeLuminance()) {
    return [
      darkMutedColor,
      dominantColor,
    ];
  } else if (dominantColor == darkMutedColor) {
    return [
      lightMutedColor,
      darkMutedColor,
    ];
  } else {
    return [
      dominantColor,
      darkMutedColor,
    ];
  }
}
