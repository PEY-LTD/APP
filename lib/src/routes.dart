part of 'app.dart';

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    //Authentication
    case Register.route:
      return KRoute(child: const Register());

    // Onboarding & Welcome
    case Splash.route:
      return KRoute(child: const Splash());

    case Onboard.route:
      return KRoute(child: const Onboard());

    case NewScreen.route:
      return KRoute(child: const NewScreen());

    default:
      return KRoute(child: const Text("Unkw"));
  }
}
