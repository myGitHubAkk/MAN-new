class Xp {
  static double xpFull = 1;
  static int xpFractional = 1;
  static double xpWhole = 0.0;
  Map<String, num> _xp = {};

  Map<String, num> get xp => _xp;

  Xp(double newXp) {
    xpFull += newXp;
    xpFractional = xpFull.toInt();
    xpWhole = xpFull - xpFractional;
    _xp = {'full': xpFull, 'fractional': xpFractional, 'whole': xpWhole};
  }
}
