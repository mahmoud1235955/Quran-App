import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:quranapp/routes/screen_routes.dart';
import 'package:quranapp/screens/azkari_screen.dart';
import 'package:quranapp/screens/home_screen.dart';
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
      initialRoute: ScreenRoutes.startScreen,
      routes: {
        ScreenRoutes.azkariScreen: (context) => const AzkariScreen(),
        ScreenRoutes.startScreen: (context) => const StartScreen(),
        ScreenRoutes.homeScreen: (context) => const HomeScreen(),
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
