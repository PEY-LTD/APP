// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:pey/src/core/resources/constants.dart';
import 'package:pey/src/core/resources/enum.dart';
import 'package:pey/src/core/resources/strings.dart';
import 'package:pey/src/core/widgets/app_button.dart';

class AppEmptyList extends StatelessWidget {
  const AppEmptyList(
      {super.key,
      this.title = "Empty",
      this.okText,
      this.subTitle =
          "Nothing here to see right now\nInformation will appear here",
      this.isSearch = false,
      this.onRefresh});

  final String title;
  final String subTitle;
  final String? okText;
  final bool isSearch;
  final void Function()? onRefresh;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            isSearch ? '$animatedPath/empty.json' : '$animatedPath/ghost.json',
            height: 120,
          ),
          if (!isSearch)
            Text(
              title,
              style: GoogleFonts.montserrat(
                  fontSize: 15, fontWeight: FontWeight.w600),
            ),
          h10,
          Text(
            subTitle,
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w400, fontSize: 14),
          ),
          h15,
          if (onRefresh != null)
            AppButton(
              width: 180,
              height: 40,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12.0,
              ),
              onPressed: onRefresh,
              text: okText ?? 'Refresh',
              type: AppButtonType.outline,
            ),
        ],
      ),
    );
  }
}
