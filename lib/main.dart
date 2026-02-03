import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:quranapp/routes/screen_routes.dart';
import 'package:quranapp/screens/ayat_screen.dart';
import 'package:quranapp/screens/azkari_screen.dart';
import 'package:quranapp/screens/home_screen.dart';
import 'package:quranapp/screens/qibla_screen.dart';
import 'package:quranapp/screens/salwat_time_screen.dart';
import 'package:quranapp/screens/start_screen.dart';

import 'generated/l10n.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('en'),
      initialRoute: ScreenRoutes.startScreen,
      routes: {
        ScreenRoutes.azkariScreen: (context) => const AzkariScreen(),
        ScreenRoutes.startScreen: (context) => const StartScreen(),
        ScreenRoutes.homeScreen: (context) => const HomeScreen(),
        ScreenRoutes.ayatScreen: (context) => const AyatScreen(),
        ScreenRoutes.salwatTime: (context) => const SalwatTimeScreen(),
        ScreenRoutes.qiblaScreen: (context) => const QiblaScreen(),
      },
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
