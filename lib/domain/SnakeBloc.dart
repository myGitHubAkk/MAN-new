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

class SnakeBloc {
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

  final _outputStateController = StreamController<List<int>>();
  Stream<List<int>> get outputStateStream => _outputStateController.stream;

  bool isGameOver() {
    for (var i = 0; i < Snake.snakePosition.length; i++) {
      int count = 0;
      for (var j = 0; j < Snake.snakePosition.length; j++) {
        if (Snake.snakePosition[i] == Snake.snakePosition[j]) {
          count += 1;
        }
        if (count == 2) {
          return true;
        }
      }
    }

    return false;
  }

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
          _outputStateController.sink.add(Snake.snakePosition);
          print('2 ${Snake.snakePosition.last}');
        } else {
          Snake.snakePosition.add(Snake.snakePosition.last - lenghtRow);
          _outputStateController.sink.add(Snake.snakePosition);
        }
      }

      if (direction == SnakeDirection.down) {
        if (Snake.snakePosition.last > sizeFieldPlay - lenghtRow - 1) {
          Snake.snakePosition
              .add(Snake.snakePosition.last + lenghtRow - sizeFieldPlay);
          _outputStateController.sink.add(Snake.snakePosition);
        } else {
          Snake.snakePosition.add(Snake.snakePosition.last + lenghtRow);
          _outputStateController.sink.add(Snake.snakePosition);
        }
      }

      if (direction == SnakeDirection.right) {
        if ((Snake.snakePosition.last + 1) % lenghtRow == 0) {
          Snake.snakePosition.add(Snake.snakePosition.last + 1 - lenghtRow);
          _outputStateController.sink.add(Snake.snakePosition);
        } else {
          Snake.snakePosition.add(Snake.snakePosition.last + 1);
          _outputStateController.sink.add(Snake.snakePosition);
        }
      }

      if (direction == SnakeDirection.left) {
        if (Snake.snakePosition.last % lenghtRow == 0) {
          Snake.snakePosition.add(Snake.snakePosition.last - 1 + lenghtRow);
          _outputStateController.sink.add(Snake.snakePosition);
        } else {
          Snake.snakePosition.add(Snake.snakePosition.last - 1);
          _outputStateController.sink.add(Snake.snakePosition);
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
      _outputStateController.sink.add(Snake.snakePosition);

      if (isGameOver()) {
        // break;
      }
    });
  }

  SnakeBloc() {
    _inputEventController.stream.listen(snakeDirection);
    snakeMove();
  }

  void dispose() {
    _inputEventController.close();
    _outputStateController.close();
  }
}
