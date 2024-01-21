import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pey/src/core/resources/colors.dart';

class TextHeader extends StatefulWidget {
  TextHeader({super.key, required this.p0, required this.p1});

  String p0;
  String p1;

  @override
  State<TextHeader> createState() => _TextHeaderState();
}

class _TextHeaderState extends State<TextHeader> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.p0,
            style: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.w700),
          ),
          Text(
            widget.p1,
            style: GoogleFonts.inter(
                color: Palette.hueTextColor,
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
