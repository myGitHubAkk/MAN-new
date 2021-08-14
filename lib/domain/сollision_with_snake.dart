import 'package:flutter/material.dart';
import 'package:man_project/data/snake.dart';
import 'package:man_project/data/subjects.dart';

class CollisionWithSnake {
  final int index;

  CollisionWithSnake(this.index);

  Widget get widget => _createWidget();

  Widget _createWidget() {
    if (Snake.snakePosition.contains(index)) {
      return Snake.snake;
    }

    if (index == Subjects.subjects['stone']!.position) {
      return Subjects.subjects['stone']!.widget;
    }

    if (index == Subjects.subjects['apple']!.position) {
      return Subjects.subjects['apple']!.widget;
    }

    // if (index == apple) {
    //   return cell(Colors.green);
    // }

    return cellTemlate(colorLight: Colors.white, colorDark: Colors.grey);
  }
}
