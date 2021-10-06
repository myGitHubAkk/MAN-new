import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';
import 'package:man_project/data/xp.dart';
import 'package:man_project/entities/user_term.dart';

class Controller extends GetxController {
  static final box = GetStorage();
  // static Map<String, num> xp = box.read('xp') ??
  //     {
  //       'full': Xp.xpFull,
  //       'fractional': Xp.xpFractional,
  //       'whole': Xp.xpWhole,
  //     };

  Map get xp =>
      box.read('xp') ??
      {
        'full': Xp.xpFull,
        'fractional': Xp.xpFractional,
        'whole': Xp.xpWhole,
      };

  void changeXp(Map val) => box.write('xp', val);

  int get namberTerm => box.read('namberTerm') ?? 1;

  void changeNamberTerm(int namber) => box.write('namberTerm', namber);
}
