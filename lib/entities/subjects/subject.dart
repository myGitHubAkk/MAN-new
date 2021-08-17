import 'package:flutter/material.dart';

abstract class Subject {
  final int position = 0;
  final Widget widget = Container();
  void snakeClash() {}
}

Widget cellTemlate({required Color colorLight, required Color colorDark}) {
  return Container(
    decoration: BoxDecoration(
      color: colorLight,
      shape: BoxShape.circle,
      border: Border.all(color: colorDark, width: 3),
    ),
  );
}
