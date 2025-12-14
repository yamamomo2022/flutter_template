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
final String appFlavor = String.fromEnvironment(
  EnvKkeys.flavor,
  defaultValue: Flavor.dev.name,
);

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final lowerCaseFlavor = appFlavor.toLowerCase();
  final resolvedFlavor = Flavor.values.asNameMap()[lowerCaseFlavor];
  if (resolvedFlavor == null) {
    F.appFlavor = Flavor.dev;
    logger.w('Unknown FLAVOR "$appFlavor"; falling back to "${F.name}".');
  } else {
    F.appFlavor = resolvedFlavor;
    logger.i('App Flavor: ${F.name}');
  }

  runApp(const ProviderScope(child: App()));
}
