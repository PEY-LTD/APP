import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pey/src/core/resources/colors.dart';

class AppCounterField extends StatefulWidget {
  final TextEditingController controller;
  final bool editable;
  final int min;
  final bool withBorder;

  const AppCounterField({
    super.key,
    required this.controller,
    this.editable = true,
    this.withBorder = true,
    this.min = 0,
  });

  @override
  State<AppCounterField> createState() => _AppCounterFieldState();
}

class _AppCounterFieldState extends State<AppCounterField> {
  @override
  void initState() {
    super.initState();

    widget.controller.addListener(() {
      if (widget.controller.text.isEmpty) {
        widget.controller.text = '${widget.min}';
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.controller.text.isEmpty) {
      widget.controller.text = '${widget.min}';
      setState(() {});
    }

    if (!widget.withBorder) {
      return SizedBox(
        height: 50.0,
        child: TextFormField(
          controller: widget.controller,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18.0),
          readOnly: !widget.editable,
          inputFormatters: [NumberTextInputFormatter()],
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(12.0),
            hintText: '0',
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            prefixIcon: SizedBox.square(
              dimension: 24,
              child: Card(
                color: Colors.white,
                surfaceTintColor: Colors.white,
                child: IconButton(
                  splashRadius: 24,
                  padding: const EdgeInsets.all(4),
                  onPressed: widget.editable
                      ? () {
                          if (int.parse(widget.controller.text) > widget.min) {
                            widget.controller.text =
                                '${int.parse(widget.controller.text) - 1}';
                          }
                        }
                      : null,
                  icon: Icon(
                    Icons.remove,
                    color: Palette.blueHue,
                  ),
                ),
              ),
            ),
            suffixIcon: SizedBox.square(
              dimension: 24,
              child: Card(
                color: Colors.white,
                surfaceTintColor: Colors.white,
                child: IconButton(
                  splashRadius: 22,
                  padding: const EdgeInsets.all(4),
                  onPressed: widget.editable
                      ? () {
                          widget.controller.text =
                              '${int.parse(widget.controller.text) + 1}';
                        }
                      : null,
                  icon: Icon(
                    Icons.add,
                    color: Palette.blueHue,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }
    return SizedBox(
      height: 50.0,
      child: TextFormField(
        controller: widget.controller,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 18.0),
        readOnly: !widget.editable,
        inputFormatters: [NumberTextInputFormatter()],
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(12.0),
          hintText: '0',
          prefixIcon: IconButton(
            splashRadius: 24,
            onPressed: widget.editable
                ? () {
                    if (int.parse(widget.controller.text) > widget.min) {
                      widget.controller.text =
                          '${int.parse(widget.controller.text) - 1}';
                    }
                  }
                : null,
            icon: const Icon(Icons.remove),
          ),
          suffixIcon: IconButton(
            splashRadius: 22,
            onPressed: widget.editable
                ? () {
                    widget.controller.text =
                        '${int.parse(widget.controller.text) + 1}';
                  }
                : null,
            icon: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}

class NumberTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    final numericRegex = RegExp(r'\d+');
    final matches = numericRegex.allMatches(newValue.text);
    final newText = matches.map((match) => match.group(0)).join(',');

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
