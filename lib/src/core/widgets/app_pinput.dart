import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import '../resources/colors.dart';

class AppPinput extends StatelessWidget {
  final TextEditingController pinController;
  final VoidCallback onComplete;
  final int count;
  final bool enabled;
  final String? Function(String?)? validator;

  const AppPinput({
    super.key,
    required this.pinController,
    required this.onComplete,
    required this.count,
    this.enabled = true,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Pinput(
      controller: pinController,
      length: count,
      validator: validator,
      enabled: enabled,
      keyboardType: TextInputType.number,
      defaultPinTheme: PinTheme(
        textStyle: const TextStyle(fontSize: 16.0),
        width: 50.0,
        height: 50.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Palette.iconColor,
          ),
        ),
      ),
      focusedPinTheme: PinTheme(
        textStyle: const TextStyle(fontSize: 16.0),
        width: 50.0,
        height: 50.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Palette.blueHue,
          ),
        ),
      ),
      onCompleted: (value) => onComplete(),
    );
  }
}
