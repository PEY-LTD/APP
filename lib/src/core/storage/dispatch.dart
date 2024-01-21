import 'package:pey/src/core/helpers/helpers.dart';
import 'package:pey/src/core/storage/database.dart';
import 'package:pey/src/core/storage/storage.dart';
import 'package:pey/src/features/users/data/models/token.dart';
import 'package:pey/src/features/users/data/models/user.dart';

///  Auth Dispatch
Token? getAuth() {
  final Map<dynamic, dynamic>? data = getStorage(path: DB.AUTH);
  if (data != null) {
    final token = Token.fromJson(data.cast<String, dynamic>());
    pp(token.accessToken);
    return token;
  }

  return null;
}

/// User Dispatch
User? get getUser {
  final data = getStorage(path: DB.USER);
  if (data != null) {
    final user = User.fromJson(data.cast<String, dynamic>());
    return user;
  }
  return null;
}
