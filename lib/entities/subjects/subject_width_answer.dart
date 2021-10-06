import 'dart:math';

import 'package:flutter/material.dart';
import 'package:man_project/data/terms.dart';
import 'package:man_project/data/xp.dart';
import 'package:man_project/domain/create_position.dart';
import 'package:man_project/entities/subjects/subject.dart';
import 'package:man_project/entities/user_term.dart';
import 'package:man_project/presentation/widget_template.dart';

class SubjectWidthAnswer extends Subject {
  CreatePosition _createPosition = CreatePosition();

  static bool isClash = false;
  static String _answer = '';
  //static int _countRandomNextAnswer = 0;

  @override
  int get position => _createPosition.posiiton;
  String get answer {
    return _answer;
  }

  @override
  void snakeClash() {
    _createPosition = CreatePosition();
    isClash = true;
  }

  @override
  void gameOver() {
    _createPosition = CreatePosition();
  }

  static void randomNextAnswer() {
    List _values = TermData.terms[UserTerm.namberTerm].values;
    List _falseValue = TermData.terms[UserTerm.namberTerm].falseValues;

    bool isZeroNamber = Random().nextBool();

    if (isZeroNamber == true) {
      _answer = _values[UserTerm.namberWord];
    } else if (isZeroNamber == false) {
      int randomNamber =
          Random().nextInt(_falseValue[UserTerm.namberWord].length - 1);
      _answer = _falseValue[UserTerm.namberWord][randomNamber];
    }

    //_countRandomNextAnswer++;

    // if (_countRandomNextAnswer % 5 == 0) {
    //   _index = UserTerm.namberWord;
    // } else {
    //   if (UserTerm.namberWord < _values.length - _maxRandom) {
    //     bool isZeroNamber = Random().nextBool();
    //     int randomNamber = isZeroNamber ? 0 : Random().nextInt(_maxRandom);
    //     _index = UserTerm.namberWord + randomNamber;
    //   } else {
    //     int randomNamber =
    //         Random().nextInt(_values.length - UserTerm.namberWord);
    //     _index = UserTerm.namberWord + randomNamber;
    //   }
    // }

    // _answer = _values[_index];
  }

  @override
  Widget get widget {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/img/фрукт.png'))),
    );
  }
}
