import 'dart:math';

import 'package:flutter/material.dart';
import 'package:man_project/domain/create_position.dart';
import 'package:man_project/entities/subjects/subject.dart';
import 'package:man_project/entities/user_term.dart';

class AppleWithWords extends Subject {
  CreatePosition createPosition = CreatePosition();

  static bool isClash = false;
  static String _answer = '';
  static int _countRandomNextAnswer = 0;

  @override
  int get position => createPosition.posiiton;
  String get answer {
    return _answer;
  }

  @override
  void snakeClash() {
    createPosition = CreatePosition();
    isClash = true;
  }

  static void randomNextAnswer() {
    const _maxRandom = 4;

    List _values = UserTerm.term.values;
    int _index = 0;

    _countRandomNextAnswer++;

    if (_countRandomNextAnswer % 5 == 0) {
      _index = UserTerm.namberWord;
    } else {
      if (UserTerm.namberWord < _values.length - _maxRandom) {
        bool isZeroNamber = Random().nextBool();
        int randomNamber = isZeroNamber ? 0 : Random().nextInt(_maxRandom);
        _index = UserTerm.namberWord + randomNamber;
      } else {
        int randomNamber =
            Random().nextInt(_values.length - UserTerm.namberWord);
        _index = UserTerm.namberWord + randomNamber;
      }
    }

    _answer = _values[_index];
  }

  @override
  Widget get widget {
    return cellTemlate(colorLight: Colors.lightGreen, colorDark: Colors.green);
  }
}
