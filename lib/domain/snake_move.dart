import 'dart:async';

import 'package:man_project/const/constFilled.dart';
import 'package:man_project/domain/checking_answer.dart';
import 'package:man_project/entities/game_state.dart';
import 'package:man_project/entities/snake.dart';
import 'package:man_project/entities/subjects/apple.dart';

enum SnakeDirection {
  up,
  down,
  left,
  right,
}

class SnakeMove {
  SnakeDirection direction = SnakeDirection.down;

  // final _inputEventController = StreamController<SnakeDirection>();
  // StreamSink<SnakeDirection> get inputEventSink => _inputEventController.sink;

  // final _outputStateController = StreamController<int>();
  // Stream<int> get outputStateStream => _outputStateController.stream;

  void snakeDirection(SnakeDirection direction) {
    this.direction = direction;
  }

  void snakeMove() {
    const duration = Duration(milliseconds: 200);

    int ii = 0;

    while (true) {
      Future.delayed(duration);
      if (GameState.isGamePause == false) {
        Snake();
        if (direction == SnakeDirection.up) {
          if (Snake.snakePosition.last < 0) {
            // int currentPosition
            // _outputStateController.sink
            //     .add(Snake.snakePosition.last + sizeFieldPlay);
            Snake.snakePosition.add(Snake.snakePosition.last + sizeFieldPlay);
          } else {
            // _outputStateController.sink
            //     .add(Snake.snakePosition.last - lenghtRow);
            Snake.snakePosition.add(Snake.snakePosition.last - lenghtRow);
          }
        }

        if (direction == SnakeDirection.down) {
          if (Snake.snakePosition.last > sizeFieldPlay - lenghtRow - 1) {
            // _outputStateController.sink
            //     .add(Snake.snakePosition.last + lenghtRow - sizeFieldPlay);
            Snake.snakePosition
                .add(Snake.snakePosition.last + lenghtRow - sizeFieldPlay);
          } else {
            // _outputStateController.sink
            //     .add(Snake.snakePosition.last + lenghtRow);
            Snake.snakePosition.add(Snake.snakePosition.last + lenghtRow);
          }
        }

        if (direction == SnakeDirection.right) {
          if ((Snake.snakePosition.last + 1) % lenghtRow == 0) {
            // _outputStateController.sink
            //     .add(Snake.snakePosition.last + 1 - lenghtRow);
            Snake.snakePosition.add(Snake.snakePosition.last + 1 - lenghtRow);
          } else {
            // _outputStateController.sink.add(Snake.snakePosition.last + 1);
            Snake.snakePosition.add(Snake.snakePosition.last + 1);
          }
        }

        if (direction == SnakeDirection.left) {
          if (Snake.snakePosition.last % lenghtRow == 0) {
            // _outputStateController.sink
            //     .add(Snake.snakePosition.last - 1 + lenghtRow);
            Snake.snakePosition.add(Snake.snakePosition.last - 1 + lenghtRow);
          } else {
            // _outputStateController.sink.add(Snake.snakePosition.last - 1);
            Snake.snakePosition.add(Snake.snakePosition.last - 1);
          }
        }

        // if (AppleWithWords.isClash) {
        //   if (CheckingAnswer.isTrueUserVersion) {
        //     continue;
        //   } else {
        //     for (var i = 0; i < 2; i++) {
        //       ii++;
        //       if (ii == 2) {
        //         ii = 0;
        //         continue;
        //       }
        //     }
        //   }
        // } else {
        Snake.snakePosition.removeAt(0);
        //}
      }
    }
  }

  SnakeMove() {
    snakeMove();
  }

  // void dispose() {
  //   _inputEventController.close();
  // }
}
