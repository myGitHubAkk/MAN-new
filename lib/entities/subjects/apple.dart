import 'dart:math';

import 'package:flutter/material.dart';
import 'package:man_project/domain/create_position.dart';
import 'package:man_project/entities/subjects/subject.dart';
import 'package:man_project/entities/user_term.dart';

class AppleWithWords extends Subject {
  CreatePosition createPosition = CreatePosition();

  static bool isClash = false;
  static String _answer = '';

  @override
  int get position => createPosition.posiiton;
  String get answer {
    return _answer;
  }

  @override
  void snakeClash() {
    createPosition = CreatePosition();
    isClash = true;
    print('яблуко');
  }

  static void randomNextAnswer() {
    const _maxRandom = 4;
    List values = UserTerm.term.values;
    int index = 0;
    if (UserTerm.namberWord < values.length - _maxRandom) {
      bool isZeroNamber = Random().nextBool();
      int randomNamber = isZeroNamber ? 0 : Random().nextInt(_maxRandom);
      index = UserTerm.namberWord + randomNamber;
    } else {
      var randomNamber = Random().nextInt(values.length - UserTerm.namberWord);
      index = UserTerm.namberWord + randomNamber;
    }

    _answer = values[index];
  }

  @override
  Widget get widget {
    return cellTemlate(colorLight: Colors.lightGreen, colorDark: Colors.green);
  }
}
