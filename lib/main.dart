import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import 'app.dart';
import 'flavors.dart';

/// Logger for the application
final logger = Logger();

FutureOr<void> main() async {
  F.appFlavor = Flavor.values.firstWhere(
    (element) => element.name == appFlavor,
  );

  logger.i('App Flavor: ${F.name}');

  runApp(const ProviderScope(child: App()));
}
