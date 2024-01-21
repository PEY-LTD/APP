import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class GlassBackground extends StatelessWidget {
  final double borderRadius;
  final Axis direction;
  final Widget child;

  const GlassBackground({
    super.key,
    this.borderRadius = 20,
    this.direction = Axis.vertical,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: direction,
      children: [
        GlassmorphicFlexContainer(
          borderRadius: borderRadius,
          blur: 15,
          alignment: Alignment.center,
          border: 0,
          linearGradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xFF000000).withOpacity(0.2),
                const Color(0xFF000000).withOpacity(0.1),
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
        )
      ],
    );
  }
}
