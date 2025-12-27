import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'flavors.dart';
import 'l10n/app_localizations.dart';
import 'router_config.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (context) => AppLocalizations.of(context)!.title,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('ja'), // Japanese
      ],
      themeMode: ThemeMode.system,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(bodyLarge: TextStyle(color: Colors.black)),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.deepPurpleAccent,
        scaffoldBackgroundColor: Color(0xFF303030),
        textTheme: const TextTheme(bodyLarge: TextStyle(color: Colors.white)),
      ),
    );
  }
}
