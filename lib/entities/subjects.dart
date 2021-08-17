import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:man_project/entities/snake.dart';
import 'package:man_project/domain/create_position.dart';
import 'package:man_project/entities/user_term.dart';

abstract class Subject {
  final int position = 0;
  final Widget widget = Container();
  void snakeClash() {}
}

class Stone extends Subject {
  CreatePosition _createPosition = CreatePosition();

  @override
  int get position => _createPosition.posiiton;

  @override
  void snakeClash() {
    Snake.gameOver();
  }

  @override
  Widget get widget {
    return cellTemlate(colorLight: Colors.grey, colorDark: Colors.grey[900]!);
  }
}

class AppleWithWords extends Subject {
  CreatePosition createPosition = CreatePosition();

  static bool isClash = false;
  static String _answer = '';

  @override
  int get position => createPosition.posiiton;
  String get answer {
    _randomAnswer();
    return _answer;
  }

  @override
  void snakeClash() {
    createPosition = CreatePosition();
    isClash = true;
    print('яблуко');
  }

  void _randomAnswer() {
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

class Subjects {
  static List<Subject> subjects = [
    Stone(),
    Stone(),
    Stone(),
    Stone(),
    AppleWithWords(),
    AppleWithWords(),
    AppleWithWords(),
  ];
}

Widget cellTemlate({required Color colorLight, required Color colorDark}) {
  return Container(
    decoration: BoxDecoration(
      color: colorLight,
      shape: BoxShape.circle,
      border: Border.all(color: colorDark, width: 3),
    ),
  );
}
