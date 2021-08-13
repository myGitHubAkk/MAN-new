import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:man_project/data/snake.dart';

class Subject {
  final int position = 0;
  final Widget widget = Container();
  void snakeClash() {}
}

class Stone implements Subject {
  @override
  int get position => 5;

  @override
  void snakeClash() {
    Snake.gameOver();
  }

  @override
  Widget get widget {
    return cellTemlate(colorLight: Colors.grey, colorDark: Colors.grey[900]!);
  }
}

Widget cellTemlate({required Color colorLight, required Color colorDark}) {
  return Container(
    decoration: BoxDecoration(
      color: colorLight,
      shape: BoxShape.circle,
      border: Border.all(color: colorDark, width: 10),
    ),
  );
}
