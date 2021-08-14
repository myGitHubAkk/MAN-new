import 'dart:async';

const int lenghtRow = 20;
const int sizeFieldPlay = 460;

enum SnakeDirection {
  up,
  down,
  left,
  right,
}

class SnakeMove {
  List<int> snakePosition = [
    0,
    lenghtRow,
    lenghtRow * 2,
    lenghtRow * 3,
    lenghtRow * 4
  ];

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
        if (snakePosition.last < 0) {
          snakePosition.add(snakePosition.last + sizeFieldPlay);
          print('2 ${snakePosition.last}');
        } else {
          snakePosition.add(snakePosition.last - lenghtRow);
        }
      }

      if (direction == SnakeDirection.down) {
        if (snakePosition.last > sizeFieldPlay - lenghtRow - 1) {
          snakePosition.add(snakePosition.last + lenghtRow - sizeFieldPlay);
        } else {
          snakePosition.add(snakePosition.last + lenghtRow);
        }
      }

      if (direction == SnakeDirection.right) {
        if ((snakePosition.last + 1) % lenghtRow == 0) {
          snakePosition.add(snakePosition.last + 1 - lenghtRow);
        } else {
          snakePosition.add(snakePosition.last + 1);
        }
      }

      if (direction == SnakeDirection.left) {
        if (snakePosition.last % lenghtRow == 0) {
          snakePosition.add(snakePosition.last - 1 + lenghtRow);
        } else {
          snakePosition.add(snakePosition.last - 1);
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
      snakePosition.removeAt(0);

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
