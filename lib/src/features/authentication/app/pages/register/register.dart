import 'package:flutter/material.dart';
import 'package:pey/src/core/resources/colors.dart';
import 'package:pey/src/core/resources/constants.dart';
import 'package:pey/src/core/widgets/app_bar.dart';
import 'package:pey/src/core/widgets/app_button.dart';
import 'package:pey/src/features/authentication/app/pages/register/registration_rutine/create_account.dart';
import 'package:pey/src/features/authentication/app/pages/register/registration_rutine/pey_identification_no.dart';
import 'package:pey/src/features/authentication/app/pages/register/registration_rutine/register_personal_information.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class Register extends StatefulWidget {
  const Register({super.key});
  static const String route = '/auth/register';

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  PageController controller = PageController();
  int currentStep = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.whiteColor,
      appBar: headerUI(),
      body: contentUI(),
    );
  }

  Widget contentUI() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          Expanded(
              child: PageView(
            controller: controller,
            onPageChanged: (value) => setState(() => currentStep = (value + 1)),
            physics: const NeverScrollableScrollPhysics(),
            children: [
              RegisterPersonalInformation(
                onSubmit: (p0, p1, p2) {},
              ),
              PeyIdentification(
                onSubmit: (p0, p1, p2) {},
              ),
              CreateAccount(
                onSubmit: (p0, p1, p2) {},
              )
            ],
          )),
          AppButton(onPressed: () {}, text: "Next"),
          hc(h: 40),
        ],
      ),
    );
  }

  KAppBar headerUI() => KAppBar(
      onPop: () => Navigator.pop(context),
      backgroundColor: Palette.whiteColor,
      child: StepProgressIndicator(
        totalSteps: 7,
        size: 7,
        currentStep: currentStep,
        customStep: (p0, p1, p2) {
          return Container(
            decoration: BoxDecoration(
                color: p1, borderRadius: BorderRadius.circular(10)),
          );
        },
        selectedColor: Palette.blueHue,
        unselectedColor: Palette.blueHue.withOpacity(.3),
        roundedEdges: const Radius.circular(10),
      ));
}
