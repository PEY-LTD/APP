import 'app_bar.dart';
import 'app_button.dart';
import 'package:flutter/material.dart';

class UnknownRoutePage extends StatelessWidget {
  const UnknownRoutePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Opp, the page you\'re looking for does not exist'),

            //* Vertical Spacer
            const SizedBox(height: 15.0),

            AppButton(width: 120, text: 'Back', onPressed: () {})
          ],
        ),
      ),
    );
  }
}
