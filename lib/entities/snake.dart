import 'dart:async';

import 'package:flutter/material.dart';
import 'package:man_project/const/colors.dart';
import 'package:man_project/const/const_filled.dart';
import 'package:man_project/entities/game_state.dart';
import 'package:man_project/entities/subjects/subject.dart';
import 'package:man_project/domain/snake_move.dart';

class Snake {
  static SnakeDirection snakeDirection = SnakeDirection.down;
  static bool isAddTail = false;

  static List<int> snakePosition = [
    tailPosition,
    tailPosition + lenghtRow,
    tailPosition + lenghtRow * 2,
    tailPosition + lenghtRow * 3,
  ];

  static Widget snake = Container(
    decoration: BoxDecoration(
      color: green,
      shape: BoxShape.circle,
      border: Border.all(color: blackGreen, width: 3),
    ),
  );

  static Widget snakeHead = Container(
    decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/img/голова.png'))),
  );

  // static void gameOver() {
  //   GameState.isGameOn = false;
  //   // Subjects().subjects.clear();
  // }

  // Snake() {
  //   // snakeUpdate();
  //   SnakeMoveBloc snakeBloc = SnakeMoveBloc();
  //   snakeBloc.outputStateStream.listen((position) {
  //     snakePosition.add(position);
  //   });
  // }

  // void snakeUpdate() {
  //   // Timer.periodic(Duration(milliseconds: 10), (timer) {
  //   // SnakeMoveBloc snakeBloc = SnakeMoveBloc();
  //   // snakeBloc.outputStateStream.listen((position) {
  //   //   snakePosition.add(position);
  //   // });
  //   // });
  // }
}
