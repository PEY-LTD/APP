import 'package:flutter/widgets.dart';
import 'package:pey/src/app.dart';

class AppRoute {
  static push({required String to, dynamic props}) {
    return PeyApp.PeyNav.currentState?.pushNamed(to, arguments: props);
  }

  static replace({required String to, dynamic props}) {
    return PeyApp.PeyNav.currentState
        ?.pushReplacementNamed(to, arguments: props);
  }

  static removeUntil({required String to, dynamic props}) {
    return PeyApp.PeyNav.currentState?.pushNamedAndRemoveUntil(
      to,
      (Route<dynamic> route) => false,
    );
  }
}
