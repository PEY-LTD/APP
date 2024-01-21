import 'package:flutter/material.dart';
import 'package:pey/src/core/storage/dispatch.dart';

class MyUserBadge extends StatelessWidget {
  final double size;
  final Color? color;

  const MyUserBadge({
    super.key,
    this.size = 10,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: SizedBox.square(
        child: getBadges,
        // child: Icon(
        //   getBadges,
        //   size: size,
        //   color: color ?? Palette.blueHue,
        // ),
      ),
    );
  }

// Use icon data
  Widget? get getBadges {
    final me = getUser!;

    return Text("ICON");
  }
}
