import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../resources/colors.dart';

import '../resources/enum.dart';

class AppButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final String? text;
  final AppButtonType? type;
  final Color? color;
  final Color? borderColor;
  final Color? textColor;
  final Color? iconColor;
  final Color? loaderColor;
  final double? width;
  final double? height;
  final double? borderRadius;
  final TextStyle? style;
  final IconData? icon;
  final double? iconSize;
  final double? iconPadding;
  final bool? loading;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Widget? image;

  final Positions positions;

  const AppButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.positions = Positions.before,
      this.type = AppButtonType.primary,
      this.borderRadius,
      this.borderColor,
      this.textColor,
      this.iconColor,
      this.iconPadding,
      this.image,
      this.padding,
      this.style,
      this.color,
      this.loaderColor,
      this.width,
      this.height,
      this.icon,
      this.iconSize,
      this.loading,
      this.margin});

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  Widget kIcon() {
    return widget.icon != null || widget.image != null
        ? Padding(
            padding: EdgeInsets.symmetric(
              horizontal: widget.iconPadding ?? 4,
            ),
            child: widget.image ??
                Icon(
                  widget.icon,
                  color: widget.iconColor ?? Colors.white,
                  size: widget.iconSize ?? 20.0,
                ),
          )
        : const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: SizedBox(
        height: widget.height ?? 55.0,
        width: widget.width,
        child: MaterialButton(
          elevation: .0,
          color: buttonColor,
          highlightElevation: .0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 10.0),
            side: BorderSide(
              width: 1.5,
              color: widget.borderColor ?? buttonOutlineColor,
            ),
          ),
          onPressed: widget.onPressed,
          padding: widget.padding,
          child: widget.loading != null && widget.loading!
              ? SizedBox.square(
                  dimension: 18,
                  child: CircularProgressIndicator(
                    strokeWidth: .7,
                    color: widget.loaderColor,
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    widget.positions == Positions.before
                        ? kIcon()
                        : const SizedBox.shrink(),
                    widget.positions == Positions.extended ||
                            widget.positions == Positions.leading
                        ? Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              textDirection:
                                  widget.positions == Positions.leading
                                      ? TextDirection.rtl
                                      : TextDirection.ltr,
                              children: [
                                widget.text == null
                                    ? const SizedBox.shrink()
                                    : Text(
                                        widget.text ?? '',
                                        style: widget.style ??
                                            GoogleFonts.inter(
                                                color: widget.textColor ??
                                                    textColor,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 17),
                                      ),
                                kIcon()
                              ],
                            ),
                          )
                        : widget.text == null
                            ? const SizedBox.shrink()
                            : Text(
                                widget.text!,
                                style: widget.style ??
                                    GoogleFonts.inter(
                                        color: widget.textColor ?? textColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 17),
                              ),
                    widget.positions == Positions.after
                        ? kIcon()
                        : const SizedBox.shrink(),
                  ],
                ),
        ),
      ),
    );
  }

  Color get buttonColor {
    switch (widget.type) {
      case AppButtonType.primary:
        return widget.color ?? Palette.blueHue;

      case AppButtonType.outline:
        return widget.color ?? Colors.transparent;

      case AppButtonType.text:
        return widget.color ?? Colors.transparent;

      case AppButtonType.secondary:
        return widget.color ?? Palette.buttonColor;

      default:
        return Theme.of(context).primaryColor;
    }
  }

  Color get buttonOutlineColor {
    switch (widget.type) {
      case AppButtonType.primary:
        return Colors.transparent;

      case AppButtonType.outline:
        return Palette.blueHue;

      case AppButtonType.text:
        return Colors.transparent;

      default:
        return Colors.transparent;
    }
  }

  Color get textColor {
    switch (widget.type) {
      case AppButtonType.primary:
        return Colors.white;

      case AppButtonType.outline:
        return Palette.blueHue;

      case AppButtonType.text:
        return Theme.of(context).primaryColor;

      default:
        return Colors.white;
    }
  }
}
