import 'package:flutter/material.dart';
import 'package:man_project/entities/snake.dart';
import 'package:man_project/entities/subjects/subject.dart';
import 'package:man_project/entities/subjects/subjects.dart';

class Field {
  final int index;

  Field(this.index);

  Widget get widget => _createWidget();

  Widget _createWidget() {
    _clashWithTail();

    if (Snake.snakePosition.contains(index)) {
      return Snake.snake;
    }

    for (var subject in Subjects.subjects) {
      _clashWithSubject(subject);
      if (index == subject.position) {
        return subject.widget;
      }
    }

    // Widget _createWidget() {
    //   if (Snake.snakePosition.contains(index)) {
    //     return Snake.snake;
    //   }

    //   for (int i = 0; i < Subjects.subjects.length; i++) {
    //     if (index == Subjects.subjects[i].position) {
    //       if (i != Subjects.subjects.length - 1) {
    //         if (Subjects.subjects[i].position !=
    //             Subjects.subjects[i + 1].position) {
    //           _clashWithSubject(Subjects.subjects[i]);
    //           return Subjects.subjects[i].widget;
    //         } else if (Subjects.subjects[i].position ==
    //             Subjects.subjects[i + 1].position) {
    //           CreatePosition();
    //           return Subjects.subjects[i].widget;
    //         }
    //       } else if (i == Subjects.subjects.length - 1) {
    //         _clashWithSubject(Subjects.subjects[i]);
    //         return Subjects.subjects[i].widget;
    //       }
    //     }
    //   }

    return cellTemlate(colorLight: Colors.white, colorDark: Colors.grey);

    // if (index == Subjects.subjects['stone']!.position) {
    //   return Subjects.subjects['stone']!.widget;
    // }

    // if (index == Subjects.subjects['apple']!.position) {
    //   return Subjects.subjects['apple']!.widget;
    // }

    // if (index == apple) {
    //   return cell(Colors.green);
    // }
  }

  void _clashWithSubject(Subject subject) {
    if (Snake.snakePosition.contains(subject.position)) {
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
          Snake.gameOver();
        }
      }
    }
  }
}
