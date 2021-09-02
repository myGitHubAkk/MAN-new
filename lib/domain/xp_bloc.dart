import 'dart:async';

import 'package:flutter/material.dart';
import 'package:man_project/data/xp.dart';

class XpBloc {
  Map<String, num> _xp = Xp.xp;

  final _inputEventController = StreamController<double>();
  StreamSink<double> get inputEventSink => _inputEventController.sink;

  final _outputStateController = StreamController<Map<String, num>>();
  Stream<Map<String, num>> get outputStateStream =>
      _outputStateController.stream;

  //преобразовує собитіє в нове состояніє
  void _addXp(double newXp) {
    Xp.xpFull += newXp;
    Xp.xpFractional = Xp.xpFull.toInt();
    Xp.xpWhole = Xp.xpFull - Xp.xpFractional;
    _xp = {
      'full': Xp.xpFull,
      'fractional': Xp.xpFractional,
      'whole': Xp.xpWhole
    };
    _outputStateController.sink.add(_xp);
  }

  //подписуємся на прослушування потока нового состоянія
  XpBloc() {
    _inputEventController.stream.listen(_addXp);
  }

  void dispose() {
    _inputEventController.close();
    _outputStateController.close();
  }
}
