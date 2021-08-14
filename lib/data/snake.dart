import 'package:flutter/material.dart';
import 'package:man_project/const/constFilled.dart';
import 'package:man_project/data/subjects.dart';

class Snake {
  static List<int> snakePosition = [
    tailPosition,
    tailPosition + lenghtRow,
    tailPosition + lenghtRow * 2,
    tailPosition + lenghtRow * 3,
  ];

  static Widget snake = cellTemlate(
    colorLight: Colors.lightGreen,
    colorDark: Colors.green,
  );
  static Widget snakeHead = cellTemlate(
    colorLight: Colors.green,
    colorDark: Colors.green,
  );

  static bool isGameOn = true;
  static bool isGameStart = true;

  static void gameOver() {
    isGameOn = false;
    // Subjects().subjects.clear();
    print(isGameOn);
  }

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
