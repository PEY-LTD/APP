// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:pey/src/core/resources/strings.dart';

class Background extends StatefulWidget {
  Background({super.key, required this.child});
  Widget child;

  @override
  State<Background> createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Image.asset(
            "$imagePath/pey_background.png",
            fit: BoxFit.cover,
          ),
        ),
        widget.child
      ],
    );
  }
}
