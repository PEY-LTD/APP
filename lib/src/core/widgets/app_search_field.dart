import 'package:flutter/material.dart';

class AppSearchField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final String hint;
  final bool isOptional;
  final bool obscure;
  final Widget? suffix;
  final IconData? prefix;
  final bool isAddress;
  final TextCapitalization? capitalization;
  final void Function(String)? onChange;
  final String? Function(String?)? validator;

  const AppSearchField({
    super.key,
    required this.controller,
    this.inputType,
    this.inputAction,
    required this.hint,
    this.onChange,
    this.isOptional = true,
    this.suffix,
    this.prefix,
    this.obscure = false,
    this.capitalization,
    this.validator,
    this.isAddress = false,
  });

  @override
  State<AppSearchField> createState() => _AppSearchFieldState();
}

class _AppSearchFieldState extends State<AppSearchField> {
  bool obscureText = false;

  @override
  void initState() {
    obscureText = widget.obscure;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        child: TextFormField(
          controller: widget.controller,
          textInputAction: widget.inputAction,
          keyboardType: widget.inputType,
          validator: widget.validator,
          spellCheckConfiguration: const SpellCheckConfiguration.disabled(),
          enableSuggestions: true,
          obscureText: obscureText,
          maxLines: widget.isAddress ? 3 : 1,
          minLines: widget.isAddress ? 3 : 1,
          onChanged: widget.onChange,
          textCapitalization: widget.capitalization ?? TextCapitalization.none,
          onTapOutside: (event) =>
              FocusManager.instance.primaryFocus?.unfocus(),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: widget.hint,
            prefixIcon:
                widget.prefix != null ? Icon(widget.prefix, size: 20.0) : null,
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(60.0),
              borderSide: const BorderSide(color: Colors.white),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(60.0),
              borderSide: const BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(60.0),
              borderSide: const BorderSide(color: Colors.white),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(60.0),
              borderSide: BorderSide(color: Colors.red.shade300),
            ),
          ),
        ),
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
    } else {
      return widget.suffix;
    }
  }
}
