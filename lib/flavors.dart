enum Flavor { dev, prod }

class F {
  static late final Flavor appFlavor;

  static String get name => appFlavor.name;

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'Flavor Template App Dev';
      case Flavor.prod:
        return 'Flavor Template App';
    }
  }
}

class EnvKkeys {
  static const flavor = 'FLAVOR';
}
