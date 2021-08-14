import 'dart:async';

import 'package:man_project/data/snake.dart';

const int lenghtRow = 20;
const int sizeFieldPlay = 460;

enum SnakeDirection {
  up,
  down,
  left,
  right,
}

class SnakeMove {
  SnakeDirection direction = SnakeDirection.down;

  final _inputEventController = StreamController<SnakeDirection>();
  StreamSink<SnakeDirection> get inputEventSink => _inputEventController.sink;

  // bool isGameOver() {
  //   for (var i = 0; i < snakePosition.length; i++) {
  //     int count = 0;
  //     for (var j = 0; j < snakePosition.length; j++) {
  //       if (snakePosition[i] == snakePosition[j]) {
  //         count += 1;
  //       }
  //       if (count == 2) {
  //         return true;
  //       }
  //     }
  //   }

  //   return false;
  // }

  // void startGame(direction) {

  //     snakeUpdate(direction);
  // if (isGameOver()) {
  //   timer.cancel();
  // }

  // }

  void snakeDirection(direction) {
    this.direction = direction;
  }

  void snakeMove() {
    const duration = Duration(milliseconds: 200);
    Timer.periodic(duration, (Timer timer) {
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

      // for (var subject in subjects.keys) {
      //   if (snakePosition.last == subject) {
      //     // generateNewApple();
      //   } else {
      // snakePosition.removeAt(0);
      // _outputStateController.sink.add(snakePosition);
      //   }
      // }

      // if (isGameOver()) {
      //   // break;
      // }
    });
  }

  SnakeMove() {
    _inputEventController.stream.listen(snakeDirection);
    snakeMove();
  }

  void dispose() {
    _inputEventController.close();
  }
}
