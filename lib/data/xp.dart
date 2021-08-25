class Xp {
  static late double xpFull = 1;
  static late int xpFractional;
  static late double xpWhole;
  static late Map<String, num> _xp;

  Map<String, num> get xp => _xp;

  Xp(double newXp) {
    xpFull += newXp;
    xpFractional = xpFull as int;
    xpWhole = xpFull - xpFractional;
    _xp = {'full': xpFull, 'fractional': xpFractional, 'whole': xpWhole};
  }
}
