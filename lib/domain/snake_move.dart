import 'dart:async';

import 'package:man_project/const/constFilled.dart';
import 'package:man_project/domain/checking_answer.dart';
import 'package:man_project/entities/game_state.dart';
import 'package:man_project/entities/snake.dart';

enum SnakeDirection {
  up,
  down,
  left,
  right,
}

class SnakeMove {
  SnakeDirection direction = SnakeDirection.down;
  static bool isSnakeRemove = false;

  void snakeDirection(SnakeDirection direction) {
    this.direction = direction;
  }

  void snakeMove() {
    const duration = Duration(milliseconds: 200);

    Timer.periodic(duration, (timer) {
      if (GameState.isGamePause == false) {
        Snake();
        if (direction == SnakeDirection.up) {
          if (Snake.snakePosition.last < 0) {
            Snake.snakePosition.add(Snake.snakePosition.last + sizeFieldPlay);
          } else {
            Snake.snakePosition.add(Snake.snakePosition.last - lenghtRow);
          }
        }

        if (direction == SnakeDirection.down) {
          if (Snake.snakePosition.last > sizeFieldPlay - lenghtRow - 1) {
            Snake.snakePosition
                .add(Snake.snakePosition.last + lenghtRow - sizeFieldPlay);
          } else {
            Snake.snakePosition.add(Snake.snakePosition.last + lenghtRow);
          }
        }

        if (direction == SnakeDirection.right) {
          if ((Snake.snakePosition.last + 1) % lenghtRow == 0) {
            Snake.snakePosition.add(Snake.snakePosition.last + 1 - lenghtRow);
          } else {
            Snake.snakePosition.add(Snake.snakePosition.last + 1);
          }
        }

        if (direction == SnakeDirection.left) {
          if (Snake.snakePosition.last % lenghtRow == 0) {
            Snake.snakePosition.add(Snake.snakePosition.last - 1 + lenghtRow);
          } else {
            Snake.snakePosition.add(Snake.snakePosition.last - 1);
          }
        }
        tailRemove();
      }
    });
  }

  int _countTailRemove = 0;

  void tailRemove() {
    if (Snake.isAddTail) {
      if (CheckingAnswer.isTrueUserVersion) {
        Snake.isAddTail = false;
      } else {
        _countTailRemove++;
        if (_countTailRemove == 2) {
          _countTailRemove = 0;
          Snake.isAddTail = false;
        }
      }
    } else {
      Snake.snakePosition.removeAt(0);
    }
  }

  SnakeMove() {
    snakeMove();
  }
}
