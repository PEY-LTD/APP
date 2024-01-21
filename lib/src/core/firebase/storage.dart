// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class FirebaseStroage {
  FirebaseStorage storage = FirebaseStorage.instance;

  Future<List<String>> UploadTask(
      {required String location, required List<String> paths}) async {
    if (paths.isEmpty) throw Error();
    List<String> downloadUrls = [];
    for (String path in paths) {
      String randomName = const Uuid().v4();
      TaskSnapshot task = await storage
          .ref()
          .child(randomName)
          .putFile(File.fromUri(Uri.parse(path)));
      String downloadURL = await task.ref.getDownloadURL();
      downloadUrls.add(downloadURL);
    }

    return (downloadUrls);
  }
}
