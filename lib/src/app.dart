import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pey/src/core/dependencies/k_route.dart';
import 'package:pey/src/core/storage/storage.dart';
import 'package:pey/src/core/theme/theme.dart';
import 'package:pey/src/features/authentication/app/pages/register/register.dart';
import 'package:pey/src/features/new_screen.dart';
import 'package:pey/src/features/onboard/app/pages/onboard.dart';
import 'package:pey/src/features/onboard/app/pages/splash.dart';

part 'routes.dart';

class PeyApp extends StatelessWidget {
  const PeyApp({
    super.key,
  });

  static final PeyNav = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: settings_storage.listenable(),
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
            navigatorKey: PeyNav,
            restorationScopeId: 'pey',
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', ''), // English, no country code
            ],
            onGenerateTitle: (BuildContext context) =>
                AppLocalizations.of(context)!.appTitle,
            theme: themeData,
            themeMode: ThemeMode.light,
            initialRoute: Splash.route,
            onGenerateRoute: onGenerateRoute);
      },
    );
  }
}
