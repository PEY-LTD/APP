import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:pey/src/core/resources/colors.dart';

class AppBorderPage {
  final BuildContext context;
  final double? offset;

  AppBorderPage(this.context, {this.offset});

  Widget glassPage({required Widget child, double? borderRadius}) {
    return Column(
      children: [
        GlassmorphicFlexContainer(
          borderRadius: borderRadius ?? 20,
          blur: 20,
          alignment: Alignment.bottomCenter,
          border: 0,
          linearGradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xFFffffff).withOpacity(0.1),
                const Color(0xFFFFFFFF).withOpacity(0.05),
              ],
              stops: const [
                0.1,
                1,
              ]),
          borderGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFFffffff).withOpacity(0.5),
              const Color((0xFFFFFFFF)).withOpacity(0.5),
            ],
          ),
          child: child,
        ),
      ],
    );
  }

  Widget dotborderPage(
      {EdgeInsets? margin, EdgeInsets? padding, required Widget child, color}) {
    return Container(
      margin: margin ?? const EdgeInsets.only(top: 30, left: 20, right: 20),
      child: DottedBorder(
        color: color ?? Palette.iconColor,
        dashPattern: const [5, 10],
        borderType: BorderType.RRect,
        radius: const Radius.circular(12),
        padding: const EdgeInsets.all(6),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          child: Container(padding: padding, child: child),
        ),
      ),
    );
  }

  Widget borderPage({required Widget child, EdgeInsets? padding}) {
    return Container(
      height: MediaQuery.of(context).size.height - (offset ?? 200),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Palette.cardColor,
        border: Border.all(
          color: Colors.grey.shade700,
          width: .5,
        ),
        borderRadius: BorderRadius.circular(16.0),
      ),
      padding: padding,
      margin: const EdgeInsets.all(24.0),
      child: child,
    );
  }
}
