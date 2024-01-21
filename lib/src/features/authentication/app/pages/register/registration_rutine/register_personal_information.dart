// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:pey/src/core/resources/constants.dart';
import 'package:pey/src/core/widgets/app_date_field.dart';
import 'package:pey/src/core/widgets/app_text_field.dart';
import 'package:pey/src/features/authentication/app/notifier/registration_notifier.dart';
import 'package:pey/src/features/authentication/app/widgets/text_header.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPersonalInformation extends StatefulWidget {
  RegisterPersonalInformation({super.key, required this.onSubmit, this.test});
  Function(String p0, String p1, String p2) onSubmit;
  var test;
  @override
  State<RegisterPersonalInformation> createState() =>
      _RegisterPersonalInformationState();
}

class _RegisterPersonalInformationState
    extends State<RegisterPersonalInformation> {
  var kAppkey = GlobalKey<FormState>();
  RegistrationNotifier registrationNotifier = RegistrationNotifier();

  Function? call;

  // @override
  // void initState() {
  //   super.initState();
  //   call = () {
  //     print("i was called");
  //   };

  //   widget.test();
  // }

  //! added text editing controllers
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: kAppkey,
        child: Column(
          children: [
            h10,
            TextHeader(
                p0: "Personal Information",
                p1: "Enter your full legal name and the Date of birth."),
            h25,
            AppTextField(
              controller: _firstNameController,
              onChange: (value) {
                registrationNotifier.setFirstName(value);
              },
              validator: Validatorless.multiple([
                Validatorless.required(
                    "First name should have at least one character.")
              ]),
              title: 'First Name',
              label: 'First name',
              hint: 'First name',
            ),
            h10,
            AppTextField(
              controller: _lastNameController,
              onChange: (value) {
                registrationNotifier.setLastName(value);
              },
              validator: Validatorless.multiple([
                Validatorless.required(
                    "Last name should have at least one character.")
              ]),
              title: 'Last Name',
              label: 'Last name',
              hint: 'Last name',
            ),
            h10,
            AppDateField(
              fromRegistration: true,
              controller: _dateController,
              onChange: (value) {
                registrationNotifier.setDob(value);
              },
              title: 'Date of Birth',
              label: 'Date of Birth',
              lastDate: DateTime.now(),
              firstDate: DateTime(1995),
              validator: Validatorless.multiple([
                Validatorless.required("Date required"),
                Validatorless.date("Date of Birth is invaild.")
              ]),
              hint: 'Date of Birth',
            )
          ],
        ),
      ),
    );
  }
}
