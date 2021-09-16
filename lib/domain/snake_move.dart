import 'dart:async';

import 'package:man_project/const/const_filled.dart';
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
  static SnakeDirection _direction = SnakeDirection.down;
  static bool isSnakeRemove = false;

  void snakeDirection(SnakeDirection direction) {
    _direction = direction;
    //print('move ${this.direction}');
    print('direction');
  }

  static void snakeMove() async {
    const duration = Duration(milliseconds: 200);

    print('move');

    //Timer.periodic(duration, (timer) {
    while (true) {
      await Future.delayed(duration);
      if (GameState.isGamePause == false) {
        if (_direction == SnakeDirection.up) {
          if (Snake.snakePosition.last < 0) {
            Snake.snakePosition.add(Snake.snakePosition.last + sizeFieldPlay);
          } else {
            Snake.snakePosition.add(Snake.snakePosition.last - lenghtRow);
          }
        }

        if (_direction == SnakeDirection.down) {
          if (Snake.snakePosition.last > sizeFieldPlay - lenghtRow - 1) {
            Snake.snakePosition
                .add(Snake.snakePosition.last + lenghtRow - sizeFieldPlay);
          } else {
            Snake.snakePosition.add(Snake.snakePosition.last + lenghtRow);
          }
        }

        if (_direction == SnakeDirection.right) {
          if ((Snake.snakePosition.last + 1) % lenghtRow == 0) {
            Snake.snakePosition.add(Snake.snakePosition.last + 1 - lenghtRow);
          } else {
            Snake.snakePosition.add(Snake.snakePosition.last + 1);
          }
        }

        if (_direction == SnakeDirection.left) {
          if (Snake.snakePosition.last % lenghtRow == 0) {
            Snake.snakePosition.add(Snake.snakePosition.last - 1 + lenghtRow);
          } else {
            Snake.snakePosition.add(Snake.snakePosition.last - 1);
          }
        }

        _tailRemove();

        // if (GameState.isGameOn == false) {
        //   timer.cancel();
        // }

      }
    }
    //});
  }

  static int _countTailRemove = 0;

  static void _tailRemove() {
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
}
