// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:pey/src/core/resources/constants.dart';
import 'package:pey/src/core/widgets/app_text_field.dart';
import 'package:pey/src/features/authentication/app/notifier/registration_notifier.dart';
import 'package:pey/src/features/authentication/app/widgets/text_header.dart';
import 'package:validatorless/validatorless.dart';

class CreateAccount extends StatefulWidget {
  CreateAccount({super.key, required this.onSubmit});
  Function(String p0, String p1, String p2) onSubmit;

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  RegistrationNotifier registrationNotifier = RegistrationNotifier();
  final TextEditingController _emailontroller = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cpasswordController = TextEditingController();

  @override
  void dispose() {
    _emailontroller.dispose();
    _passwordController.dispose();
    _cpasswordController.dispose();
    super.dispose();
  }

  var kAppkey = GlobalKey<FormState>();
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
                p0: "Create your account", p1: "Enter your Email and password"),
            h25,
            AppTextField(
              controller: _emailontroller,
              onChange: (value) {
                registrationNotifier.setEmail(value);
              },
              validator: Validatorless.multiple([
                Validatorless.required(
                    "First name should have at least one character."),
                Validatorless.email("Invalid email address")
              ]),
              title: 'Email',
              label: 'email',
              hint: 'Email Address',
            ),
            h10,
            AppTextField(
              controller: _passwordController,
              onChange: (value) {
                registrationNotifier.setPassword(value);
              },
              validator: Validatorless.multiple([
                Validatorless.required(
                    "First name should have at least one character.")
              ]),
              title: 'Password',
              label: 'password',
              hint: 'Password',
              obscure: true,
            ),
            h10,
            AppTextField(
              obscure: true,
              onChange: (value) {
                registrationNotifier.setcPassword(value);
              },
              controller: _cpasswordController,
              validator: Validatorless.multiple([
                Validatorless.required(
                    "First name should have at least one character.")
              ]),
              title: 'Confirm Password',
              label: 'password',
              hint: 'Confirm Password',
            ),
          ],
        ),
      ),
    );
  }
}
