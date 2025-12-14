import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import 'app.dart';
import 'flavors.dart';

/// Logger for the application
final logger = Logger();

/// Flavor name provided via `--dart-define=FLAVOR=<dev|prod>`.
///
/// Defaults to `dev` to avoid crashing the app when the value is missing or
/// invalid.
const appFlavor = String.fromEnvironment('FLAVOR', defaultValue: 'dev');

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  F.appFlavor = Flavor.values.firstWhere(
    (element) => element.name == appFlavor.toLowerCase(),
    orElse: () => Flavor.dev,
  );

  if (F.appFlavor.name != appFlavor.toLowerCase()) {
    logger.w('Unknown FLAVOR "$appFlavor"; falling back to "${F.name}".');
  } else {
    logger.i('App Flavor: ${F.name}');
  }

  runApp(const ProviderScope(child: App()));
}
