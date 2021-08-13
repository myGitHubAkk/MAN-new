import 'dart:async';

import 'package:man_project/domain/SnakeBloc.dart';

class Snake {
  int tailPosition = 5;
  static List<int> snakePosition = [5, 25, 45, 65];

  // Snake() {
  //   snakeUpdate();
  // }

  // void snakeUpdate() {
  //   Timer.periodic(Duration(milliseconds: 10), (timer) {
  //     SnakeBloc snakeBloc = SnakeBloc();
  //     snakeBloc.outputStateStream.listen((event) {
  //       snakePosition = event;
  //     });
  //   });
  // }
}
