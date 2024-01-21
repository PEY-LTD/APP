import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pey/src/app.dart';
import 'package:pey/src/core/resources/colors.dart';
import 'package:pey/src/core/resources/constants.dart';
import 'package:pey/src/core/resources/enum.dart';
import 'package:pey/src/core/widgets/app_button.dart';
import 'package:pey/src/features/authentication/app/pages/register/register.dart';
import 'package:pey/src/features/onboard/app/widget/background.dart';
import 'package:pey/src/features/onboard/data/constants/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});
  static const String route = '/onboard';

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  var controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.blueHue,
      body: Background(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
            child: Column(children: [
              h10,
              SmoothPageIndicator(
                controller: controller,
                count: onboardingMessages.length,
                axisDirection: Axis.horizontal,
                effect: SlideEffect(
                    spacing: 8.0,
                    radius: 10.0,
                    dotWidth: 10.0,
                    dotHeight: 10.0,
                    dotColor: Colors.grey.shade200,
                    activeDotColor: Palette.blueHue),
              ),
              h15,
              SizedBox(
                height: 130,
                child: PageView.builder(
                    controller: controller,
                    itemCount: onboardingMessages.length,
                    itemBuilder: (_, index) {
                      return Column(
                        children: [
                          Text(
                            onboardingMessages[index]["title"]!,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w700, fontSize: 24),
                          ),
                          h15,
                          Text(
                            onboardingMessages[index]["subTitle"]!,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                                color: Palette.hueTextColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 13),
                          )
                        ],
                      );
                    }),
              ),
              h15,
              AppButton(
                  onPressed: () =>
                      PeyApp.PeyNav.currentState?.pushNamed(Register.route),
                  text: "Create an account"),
              h20,
              AppButton(
                onPressed: () {},
                text: "Log in",
                type: AppButtonType.outline,
              ),
              h15,
            ]),
          )
        ],
      )),
    );
  }
}
