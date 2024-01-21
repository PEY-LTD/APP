import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pey/src/core/resources/colors.dart';
import 'package:pey/src/core/resources/constants.dart';
import 'package:pey/src/core/widgets/app_bar.dart';
import 'package:pey/src/core/widgets/app_button.dart';
import 'package:pey/src/features/authentication/app/notifier/registration_notifier.dart';
import 'package:pey/src/features/authentication/app/pages/register/registration_rutine/create_account.dart';
import 'package:pey/src/features/authentication/app/pages/register/registration_rutine/pey_identification_no.dart';
import 'package:pey/src/features/authentication/app/pages/register/registration_rutine/register_personal_information.dart';
import 'package:pey/src/features/new_screen.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../../../app.dart';

class Register extends StatefulWidget {
  const Register({super.key});
  static const String route = '/auth/register';

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  RegistrationNotifier registrationNotifier = RegistrationNotifier();
  PageController controller = PageController();
  int currentStep = 1;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: registrationNotifier.page - 1);
  }

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
            onPageChanged: (value) => setState(() {
              registrationNotifier.setPage(value + 1);
            }),
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
          registrationNotifier.isRegistrationLoading
              ? const Center(
                  child: CupertinoActivityIndicator(
                    color: Colors.black,
                  ),
                )
              : AppButton(
                  onPressed: () async {
                    print(
                        'first name: ${registrationNotifier.firstName}\nlast name: ${registrationNotifier.lastName}\ndob: ${registrationNotifier.dob}\nusername: ${registrationNotifier.username}');

                    switch (registrationNotifier.page) {
                      case 1:
                        if (registrationNotifier.firstName.isNotEmpty &&
                            registrationNotifier.lastName.isNotEmpty &&
                            registrationNotifier.dob.isNotEmpty) {
                          controller.animateToPage(1,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut);
                        }
                        break;
                      case 2:
                        if (registrationNotifier.username.isNotEmpty) {
                          controller.animateToPage(2,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut);
                        }
                        break;

                      case 3:
                        if (registrationNotifier.email.isNotEmpty &&
                            registrationNotifier.password.isNotEmpty &&
                            registrationNotifier.cpassword.isNotEmpty) {
                          setState(() {});
                          registrationNotifier.navigateToNewScreen();
                        }
                        break;
                      default:
                    }

                    // controller.animateToPage(1,
                    //     duration: const Duration(milliseconds: 300),
                    //     curve: Curves.easeInOut);
                  },
                  text: "Next"),
          hc(h: 40),
        ],
      ),
    );
  }

  KAppBar headerUI() => KAppBar(
      onPop: () => Navigator.pop(context),
      backgroundColor: Palette.whiteColor,
      child: StepProgressIndicator(
        totalSteps: 3,
        size: 7,
        currentStep: registrationNotifier.page,
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
