import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:pey/src/core/resources/strings.dart';
import 'package:pey/src/core/widgets/app_button.dart';

class KAppBar extends AppBar {
  final String? titleText;
  final List<Widget>? actionButtons;
  final PreferredSizeWidget? bottomView;
  final Widget? leadingView;
  final Widget? child;
  final VoidCallback? onPop;
  final double? height;
  final double? leadingViewWidth;
  final TextStyle? titleStyle;
  final Color? backgroundColor;

  final double _icon_size = 32;

  KAppBar({
    super.key,
    this.titleText,
    this.actionButtons,
    this.bottomView,
    this.leadingView,
    this.height,
    this.child,
    this.backgroundColor,
    this.titleStyle,
    this.onPop,
    this.leadingViewWidth,
  }) : super(
          title: child != null
              ? Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: child,
                )
              : (titleText != null
                  ? Text(
                      titleText,
                      style: titleStyle,
                    )
                  : null),
          actions: actionButtons,
          centerTitle: true,
          elevation: 0.0,
          toolbarHeight: height,
          backgroundColor: backgroundColor ?? Colors.white,
          bottom: bottomView,
          leadingWidth: leadingViewWidth ?? 50,
          leading: leadingView ??
              (onPop != null
                  ? AppButton(
                      onPressed: onPop,
                      text: "",
                      padding: EdgeInsets.zero,
                      color: Colors.transparent,
                      borderRadius: 30,
                      image: SvgPicture.asset(
                        '$svgPath/arrow_left.svg',
                        width: 33,
                        height: 33,
                      ),
                    )
                  : const SizedBox.shrink()),
        );
}
