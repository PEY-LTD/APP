import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pey/src/core/extension/extensions.dart';
import 'package:pey/src/core/resources/colors.dart';
import 'package:pey/src/core/resources/constants.dart';
import 'package:pey/src/core/resources/enum.dart';
import 'package:pey/src/core/resources/strings.dart';
import '../helpers/helpers.dart';

class AppDateField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final String hint;
  final String label;
  final String? title;
  final String? error;
  final double? height;
  final double? borderRadius;
  final bool isOptional;
  final bool obscure;
  final Widget? suffix;
  final IconData? prefix;
  final double? prefixSize;
  final DateTime firstDate;
  final DateTime lastDate;
  final Color? borderColor;
  final Color? fillColor;
  final bool isTextArea;
  final TextCapitalization? capitalization;
  final void Function(String)? onChange;
  final String? Function(String?)? validator;
  final bool? editable;
  final TextFiledDecorationType docorationType;
  final bool? loading;

  const AppDateField({
    super.key,
    required this.controller,
    this.inputType,
    this.inputAction,
    required this.hint,
    required this.label,
    required this.firstDate,
    required this.lastDate,
    this.fillColor,
    this.error,
    this.title,
    this.docorationType = TextFiledDecorationType.normal,
    this.onChange,
    this.borderColor,
    this.borderRadius = 12,
    this.isOptional = true,
    this.height,
    this.suffix,
    this.prefixSize,
    this.prefix,
    this.obscure = false,
    this.capitalization,
    this.validator,
    this.isTextArea = false,
    this.editable,
    this.loading,
  });

  @override
  State<AppDateField> createState() => _AppDateFieldState();
}

class _AppDateFieldState extends State<AppDateField> {
  bool obscureText = false;
  String? errorText;

  @override
  void initState() {
    obscureText = widget.obscure;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.error != null) {
      errorText = widget.error;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.title == null
              ? const SizedBox()
              : Column(
                  children: [
                    Text(
                      widget.title!,
                      style: GoogleFonts.inter(fontSize: 16),
                    ),
                    h5,
                  ],
                ),
          SizedBox(
            height: widget.height,
            child: TextFormField(
              controller: widget.controller,
              textInputAction: widget.inputAction,
              style: GoogleFonts.inter(
                fontSize: 16.0,
                color: Palette.black,
              ),
              keyboardType: widget.inputType,
              validator: (error) {
                String? errorMessage = widget.validator?.call(error);
                setState(() => errorText = errorMessage);
                return;
              },
              autocorrect: false,
              readOnly: true,
              enabled: widget.editable,
              spellCheckConfiguration: const SpellCheckConfiguration.disabled(),
              enableSuggestions: true,
              obscureText: obscureText,
              maxLines: widget.isTextArea ? 3 : 1,
              minLines: widget.isTextArea ? 3 : 1,
              onChanged: widget.onChange,
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: widget.firstDate,
                  lastDate: widget.lastDate,
                );

                if (date != null) {
                  widget.controller.text = date.toDateString;
                }
              },
              textCapitalization:
                  widget.capitalization ?? TextCapitalization.none,
              onTapOutside: (event) =>
                  FocusManager.instance.primaryFocus?.unfocus(),
              decoration: InputDecoration(
                filled: widget.docorationType == TextFiledDecorationType.filled,
                fillColor: widget.fillColor ?? Palette.cardColor,
                errorBorder: widget.borderRadius == null
                    ? null
                    : OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Palette.borderTextColor),
                        borderRadius:
                            BorderRadius.circular(widget.borderRadius!),
                      ),
                border: widget.borderRadius == null
                    ? null
                    : OutlineInputBorder(
                        borderSide: BorderSide(
                            color:
                                widget.borderColor ?? Palette.borderTextColor),
                        borderRadius:
                            BorderRadius.circular(widget.borderRadius!),
                      ),
                focusedBorder: widget.borderRadius == null
                    ? null
                    : OutlineInputBorder(
                        borderSide: BorderSide(
                            color:
                                widget.borderColor ?? Palette.borderTextColor),
                        borderRadius:
                            BorderRadius.circular(widget.borderRadius!),
                      ),
                disabledBorder: widget.borderRadius == null
                    ? null
                    : OutlineInputBorder(
                        borderSide: BorderSide(
                            color:
                                widget.borderColor ?? Palette.borderTextColor),
                        borderRadius:
                            BorderRadius.circular(widget.borderRadius!)),
                enabledBorder: widget.borderRadius == null
                    ? null
                    : OutlineInputBorder(
                        borderSide: BorderSide(
                            color:
                                widget.borderColor ?? Palette.borderTextColor),
                        borderRadius:
                            BorderRadius.circular(widget.borderRadius!)),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 17,
                ),
                hintStyle: GoogleFonts.inter(
                    color: Palette.hueTextColor, fontSize: 16),
                hintText: widget.hint,
                // errorStyle: GoogleFonts.inter(color: Palette.red, fontSize: 15),
                prefixIcon: widget.prefix != null
                    ? Icon(widget.prefix, size: widget.prefixSize ?? 20.0)
                    : null,
                suffixIcon: suffixIcon,
              ),
            ),
          ),
          errorText == null
              ? const SizedBox.shrink()
              : Text(
                  "$errorText",
                  style: GoogleFonts.inter(
                      color: Colors.red.shade500,
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                )
        ],
      ),
    );
  }

  Widget? get suffixIcon {
    if (widget.obscure) {
      return IconButton(
        splashRadius: 20.0,
        onPressed: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
        icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
      );
    } else if (widget.loading != null && widget.loading!) {
      return const SizedBox.square(
        dimension: 20.0,
        child: Align(
          child: SizedBox.square(
            dimension: 20,
            child: CircularProgressIndicator(
              strokeWidth: 0.8,
              color: Palette.blueHue,
            ),
          ),
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.all(10),
        child: SvgPicture.asset(
          '$svgPath/icon_calender.svg',
        ),
      );
    }
  }
}
