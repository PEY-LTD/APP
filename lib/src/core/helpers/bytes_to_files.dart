import 'dart:io';
import 'dart:typed_data';

import 'package:mime/mime.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pey/src/core/helpers/helpers.dart';

import 'generate_random.dart';

Future<File> writeDataToFile(Uint8List data) async {
  String? mime = lookupMimeType('', headerBytes: data);
  final ext = extensionFromMime(mime!);

  pp(mime);

  return getTemporaryDirectory().then((tempDir) {
    final path = '${tempDir.path}/${getRandomString(15)}.$ext';

    return File(path).writeAsBytes(data);
  });
}
