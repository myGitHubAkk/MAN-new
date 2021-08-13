import 'package:flutter/cupertino.dart';

class Subject {
  final int position = 0;
  final Widget widget = Container();
  void snakeClash() {}
}

class Stone implements Subject {
  @override
  int get position => throw UnimplementedError();

  @override
  void snakeClash() {}

  @override
  Widget get widget => throw UnimplementedError();
}
