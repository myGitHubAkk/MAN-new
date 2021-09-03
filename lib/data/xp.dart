class Xp {
  static double xpFull = 1;
  static int xpFractional = 1;
  static double xpWhole = 0.0;
  static Map<String, num> xp = {
    'full': xpFull,
    'fractional': xpFractional,
    'whole': xpWhole,
  };

  void addXp(double newXp) {
    Xp.xpFull += newXp;
    Xp.xpFractional = Xp.xpFull.toInt();
    Xp.xpWhole = Xp.xpFull - Xp.xpFractional;
  }
}
