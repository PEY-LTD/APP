import 'package:flutter/material.dart';
import 'package:pey/src/core/resources/colors.dart';

class LoadingView extends StatelessWidget {
  final double size;
  final Color color;

  const LoadingView(
      {super.key, this.size = 100, this.color = Palette.whiteColor});

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Material(
        type: MaterialType.transparency,
        child: Center(
          child: SizedBox.square(
            dimension: size,
            child: CircularProgressIndicator(
              strokeWidth: 0.9,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
