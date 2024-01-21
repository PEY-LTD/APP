import 'package:flutter/material.dart';
import '../resources/colors.dart';

class AppDropField extends StatefulWidget {
  final String? value;
  final String hint;
  final String label;
  final double? height;
  final double borderRadius;
  final Color? fillColor;
  final Color? borderColor;
  final bool isOptional;
  final List<String> items;
  final IconData? prefix;
  final void Function(String?) onChange;
  final String? Function(String?)? validator;

  final EdgeInsets? padding;

  const AppDropField({
    super.key,
    required this.hint,
    required this.label,
    this.padding,
    this.height,
    this.borderColor,
    this.isOptional = true,
    this.fillColor,
    this.prefix,
    this.validator,
    this.borderRadius = 30.0,
    this.value,
    required this.items,
    required this.onChange,
  });

  @override
  State<AppDropField> createState() => _AppDropFieldState();
}

class _AppDropFieldState extends State<AppDropField> {
  String? selectedItem;

  @override
  void initState() {
    super.initState();
    selectedItem = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        child: DropdownButtonFormField(
          validator: widget.validator,
          items: widget.items
              .map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: Text(e),
                ),
              )
              .toList(),
          value: selectedItem,
          onChanged: (value) {
            setState(() {
              selectedItem = value;
            });

            widget.onChange(value);
          },
          style: TextStyle(
            fontSize: 14.0,
            color: Palette.textColor,
          ),
          decoration: InputDecoration(
            contentPadding: widget.padding ??
                const EdgeInsets.symmetric(vertical: 12, horizontal: 12.0),
            hintText: widget.hint,
            filled: widget.fillColor != null,
            fillColor: widget.fillColor,
            errorBorder: border(isError: true),
            focusedBorder: border(),
            enabledBorder: border(),
            border: border(),
            prefixIcon:
                widget.prefix != null ? Icon(widget.prefix, size: 20.0) : null,
          ),
        ),
      ),
    );
  }

  OutlineInputBorder border({isError}) {
    return OutlineInputBorder(
        borderSide: BorderSide(color: widget.borderColor ?? Palette.iconColor),
        borderRadius: BorderRadius.circular(widget.borderRadius));
  }
}
