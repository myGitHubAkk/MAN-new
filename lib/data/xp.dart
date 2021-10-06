import 'package:man_project/domain/controller.dart';
import 'package:get/get.dart';

class Xp {
  static Controller controller = Get.put(Controller());

  static double xpFull = 1;
  static int xpFractional = 1;
  static double xpWhole = 0.0;
  static Map xp = controller.xp;

  void addXp(double newXp) {
    xp['full'] += newXp;
    xp['fractional'] = xp['full'].toInt();
    xp['whole'] = xp['full'] - xp['fractional'];
    // Xp.xpFull += newXp;
    // Xp.xpFractional = Xp.xpFull.toInt();
    // Xp.xpWhole = Xp.xpFull - Xp.xpFractional;
  }
}
