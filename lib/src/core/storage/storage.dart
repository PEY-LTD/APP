// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:hive_flutter/hive_flutter.dart';
import 'package:pey/src/core/storage/database.dart';

late Box main_storage;
late Box settings_storage;

initStorage() async {
  await Hive.initFlutter();
  main_storage = await Hive.openBox(DB.BOX_MAIN_DATABASE);
  settings_storage = await Hive.openBox(DB.BOX_SETTINGS);
}

getStorage({required String path, temp}) {
  if (temp != null) {
    return main_storage.get(path, defaultValue: temp);
  }
  return main_storage.get(path);
}

setStorage({required String key, required value}) {
  return main_storage.put(key, value);
}

getSettings({required String path}) {
  return settings_storage.get(path);
}

setSettings({required String key, required value}) {
  return settings_storage.put(key, value);
}

logout() {
  main_storage.clear();
}

clearData(List<String> keys) {
  return main_storage.deleteAll(keys);
}
