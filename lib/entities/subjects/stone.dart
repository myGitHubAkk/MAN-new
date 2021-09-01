import 'package:flutter/material.dart';
import 'package:man_project/const/constFilled.dart';
import 'package:man_project/domain/create_position.dart';
import 'package:man_project/entities/game_state.dart';
import 'package:man_project/entities/snake.dart';
import 'package:man_project/entities/subjects/apple.dart';
import 'package:man_project/entities/subjects/subject.dart';
import 'package:man_project/entities/user_term.dart';

class Stone extends Subject {
  CreatePosition _createPosition = CreatePosition();

  @override
  int get position => _createPosition.posiiton;

  @override
  void snakeClash() {
    GameState.isGameOn = false;
  }

  @override
  void gameOver() {
    _createPosition = CreatePosition();
  }

  @override
  Widget get widget {
    return cellTemlate(colorLight: Colors.grey, colorDark: Colors.grey[900]!);
  }
}
