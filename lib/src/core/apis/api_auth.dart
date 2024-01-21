import 'dart:io';

import 'package:pey/src/core/storage/dispatch.dart';

Map<String, String> get headers {
  return {
    'Content-type': 'application/json',
    'Authorization': 'Bearer ${(getAuth())?.accessToken ?? ''}',
    'Accept': 'application/json'
  };
}

Map<String, String> get formHeaders {
  return {
    'Content-Type': 'multipart/form-data',
    'Accept': "application/json",
    HttpHeaders.authorizationHeader: 'Bearer ${(getAuth())?.accessToken ?? ''}',
  };
}
