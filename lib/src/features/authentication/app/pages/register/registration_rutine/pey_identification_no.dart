// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:pey/src/core/resources/constants.dart';
import 'package:pey/src/core/widgets/app_text_field.dart';
import 'package:pey/src/features/authentication/app/widgets/text_header.dart';
import 'package:validatorless/validatorless.dart';

class PeyIdentification extends StatefulWidget {
  PeyIdentification({super.key, required this.onSubmit});
  Function(String p0, String p1, String p2) onSubmit;
  Function? runTask;

  @override
  State<PeyIdentification> createState() => _PeyIdentificationState();
}

class _PeyIdentificationState extends State<PeyIdentification> {
  @override
  var kAppkey = GlobalKey<FormState>();

  _PeyIdentificationState() {
    widget.runTask = () {
      print("object");
    };
  }

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: kAppkey,
        child: Column(
          children: [
            h10,
            TextHeader(
                p0: "Choose a Pey ID",
                p1: "Your unique ID for receiving money"),
            h25,
            AppTextField(
              controller: TextEditingController(),
              validator: Validatorless.multiple([
                Validatorless.required(
                    "First name should have at least one character.")
              ]),
              title: 'Username',
              label: 'Username',
              hint: '@Username',
            ),
          ],
        ),
      ),
    );
  }
}
