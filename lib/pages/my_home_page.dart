import 'package:flutter/material.dart';

import '../flavors.dart';
import '../l10n/app_localizations.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.title)),
      body: Center(child: Text('Hello ${F.title}')),
    );
  }
}
