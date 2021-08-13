import 'dart:math';

import 'package:man_project/const/constFilled.dart';

class CreatePosition {
  late int posiiton;
  CreatePosition() {
    createPosition();
  }

  void createPosition() {
    Random random = Random();
    posiiton = random.nextInt(sizeFieldPlay);
  }
}
