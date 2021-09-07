import 'dart:math';

import 'package:man_project/const/constFilled.dart';

class CreatePosition {
  late int posiiton;
  CreatePosition() {
    createPosition();
  }

  void createPosition() {
    Random _random = Random();
    int _randomPosiiton = _random.nextInt(sizeFieldPlay);
    List<int> _safeStraight = [];

    for (var i = 1; i < sizeFieldPlay / lenghtRow; i++) {
      _safeStraight.add(tailPosition + lenghtRow * i);
    }

    if (_safeStraight.contains(_randomPosiiton)) {
      _randomPosiiton = _random.nextInt(sizeFieldPlay);
    }

    if (!_safeStraight.contains(_randomPosiiton)) {
      posiiton = _randomPosiiton;
    }
  }
}
