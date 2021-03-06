import 'package:flutter/material.dart';
import 'package:man_project/const/colors.dart';
import 'package:man_project/const/const_filled.dart';
import 'package:man_project/domain/checking_answer.dart';
import 'package:man_project/entities/game_state.dart';
import 'package:man_project/entities/snake.dart';
import 'package:man_project/entities/subjects/subject_width_answer.dart';
import 'package:man_project/entities/subjects/subject.dart';
import 'package:man_project/entities/subjects/subjects.dart';
import 'package:man_project/entities/user_term.dart';

class Field {
  final int index;

  Field(this.index);

  Widget get widget => _createWidget();

  Widget _createWidget() {
    _clashWithTail();

    if (Snake.snakePosition.last == index) {
      Snake snake = Snake();
      return snake.snakeHead;
    }

    if (Snake.snakePosition.contains(index)) {
      return Snake.snake;
    }

    // for (var subject in Subjects.subjects) {
    //   _clashWithSubject(subject);
    //   if (index == subject.position) {
    //     _subject.add(index);
    //     _check(subject);
    //   }
    // }

    int _count = 0;

    for (var subject in Subjects.subjects) {
      _clashWithSubject(subject);
      if (index == subject.position) {
        _count++;
        if (_count > 1) {
          break;
        }
        return subject.widget;
      }
    }

    return SizedBox();
  }

  // Widget _check(Subject subject) {
  //   for (var i = 0; i < _subject.length; i++) {
  //     if (i < _subject.length) {
  //       if (_subject[i] == _subject[i + 1]) {
  //         return cellTemlate(colorLight: Colors.white, colorDark: Colors.grey);
  //       } else {
  //         return subject.widget;
  //       }
  //     }
  //   }

  //   return cellTemlate(colorLight: Colors.white, colorDark: Colors.grey);
  // }

  void _clashWithSubject(Subject subject) {
    if (Snake.snakePosition.last == subject.position) {
      subject.snakeClash();
    }
  }

  void _clashWithTail() {
    for (var index1 = 0; index1 < Snake.snakePosition.length; index1++) {
      int count = 0;
      for (var index2 = 0; index2 < Snake.snakePosition.length; index2++) {
        if (Snake.snakePosition[index1] == Snake.snakePosition[index2]) {
          count += 1;
        }
        if (count == 2) {
          GameState.isShowDialogGameOver = false;
        }
      }
    }
  }
}
