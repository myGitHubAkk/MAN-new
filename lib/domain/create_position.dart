import 'dart:math';

import 'package:man_project/const/const_filled.dart';

class CreatePosition {
  late int posiiton;
  List<int> _safeStraight = [];
  List<int> _positions = [];
  List<int> _leftBorder = [1];
  List<int> _rightBorder = [];

  CreatePosition() {
    createPosition();
  }

  void createPosition() {
    Random _random = Random();
    int _randomPosiiton = _random.nextInt(sizeFieldPlay);

    for (var i = 1; i < sizeFieldPlay / lenghtRow; i++) {
      _safeStraight.add(tailPosition + lenghtRow * i);
      _rightBorder.add(i * lenghtRow);
      if (i * lenghtRow + 1 <= sizeFieldPlay) {
        _leftBorder.add(i * lenghtRow + 1);
      } else {
        continue;
      }
    }

    if (_safeStraight.contains(_randomPosiiton) ||
        _randomPosiiton < lenghtRow ||
        _randomPosiiton > sizeFieldPlay - lenghtRow ||
        _leftBorder.contains(_randomPosiiton) ||
        _rightBorder.contains(_randomPosiiton)) {
      createPosition();
    }

    posiiton = _randomPosiiton;

    _checkRepeat(_random);
  }

  void _checkRepeat(Random random) {
    if (_positions.length == 1) {
      posiiton = random.nextInt(sizeFieldPlay);
      _positions.add(posiiton);
    } else if (_positions.length > 1) {
      for (var i = 0; i < _positions.length; i++) {
        if (i != _positions.length - 1) {
          if (_positions[i] == _positions[i++]) {
            posiiton = random.nextInt(sizeFieldPlay);
            _positions.add(posiiton);
          }
        } else if (i == _positions.length - 1) {
          if (_positions[i] == _positions[i--]) {
            posiiton = random.nextInt(sizeFieldPlay);
            _positions.add(posiiton);
          }
        }
      }
    }
  }
}
