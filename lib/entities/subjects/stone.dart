import 'package:flutter/material.dart';
import 'package:man_project/domain/create_position.dart';
import 'package:man_project/entities/snake.dart';
import 'package:man_project/entities/subjects/subject.dart';

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
