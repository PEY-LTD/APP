import 'package:flutter/material.dart';
import 'package:pey/src/features/users/data/models/user.dart';

class UserBadge extends StatelessWidget {
  final User user;
  final double size;
  final Color? color;

  const UserBadge({
    super.key,
    this.size = 10,
    this.color,
    required this.user,
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

  Widget? get getBadges {
    return Text("Badge");
  }
}
