import 'package:flutter/material.dart';
import 'package:pey/src/core/storage/storage.dart';

import 'src/app.dart';

void main() async {
  await initStorage();
  runApp(const PeyApp());
}
