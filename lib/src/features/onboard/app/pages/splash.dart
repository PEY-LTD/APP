// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pey/src/core/resources/colors.dart';
import 'package:pey/src/core/resources/strings.dart';
import 'package:pey/src/core/router/navigate.dart';
import 'package:pey/src/core/storage/database.dart';
import 'package:pey/src/core/storage/dispatch.dart';
import 'package:pey/src/core/storage/storage.dart';
import 'package:pey/src/features/authentication/app/pages/login.dart';
import 'package:pey/src/features/onboard/app/pages/onboard.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});
  static const String route = '/';

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    navigate_();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.blueHue,
      body: Center(
        child: SvgPicture.asset(
          '$svgPath/pey_icon_text.svg',
          width: 170,
        ),
      ),
    );
  }

  void navigate_() => Timer(
      const Duration(seconds: 3),
      () => getStorage(path: DB.FIRST_USE) == null
          ? AppRoute.replace(to: Onboard.route)
          : getUser == null
              ? AppRoute.replace(to: Login.route)
              : AppRoute.replace(to: Login.route));
}
