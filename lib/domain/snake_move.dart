import 'dart:async';

import 'package:man_project/const/constFilled.dart';
import 'package:man_project/data/snake.dart';

enum SnakeDirection {
  up,
  down,
  left,
  right,
}

class SnakeMoveBloc {
  // List<int> snakePosition = [
  //   0,
  //   lenghtRow,
  //   lenghtRow * 2,
  //   lenghtRow * 3,
  //   lenghtRow * 4
  // ];

  SnakeDirection direction = SnakeDirection.down;

  final _inputEventController = StreamController<SnakeDirection>();
  StreamSink<SnakeDirection> get inputEventSink => _inputEventController.sink;

  // bool isGameOver() {
  //   for (var i = 0; i < Snake.snakePosition.length; i++) {
  //     int count = 0;
  //     for (var j = 0; j < Snake.snakePosition.length; j++) {
  //       if (Snake.snakePosition[i] == Snake.snakePosition[j]) {
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
      //   if (Snake.snakePosition.last == subject) {
      //     // generateNewApple();
      //   } else {
      // Snake.snakePosition.removeAt(0);
      // _outputStateController.sink.add(Snake.snakePosition);
      //   }
      // }
      Snake.snakePosition.removeAt(0);
      // _outputStateController.sink.add(Snake.snakePosition);

      // if (isGameOver()) {
      //   // break;
      // }
    });
  }

  SnakeMoveBloc() {
    _inputEventController.stream.listen(snakeDirection);
    snakeMove();
  }

  void dispose() {
    _inputEventController.close();
  }
}
