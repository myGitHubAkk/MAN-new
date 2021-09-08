import 'dart:async';

import 'dart:isolate';

import 'package:man_project/entities/game_state.dart';

class MainLoop {
  static bool isRuningLoop = true;

  static void startLoop(SendPort sendPort) async {
    print('startLoop');
    Timer.periodic(
      Duration(milliseconds: 20),
      (timer) {
        if (isRuningLoop == true) {
          sendPort.send(true);
        } else if (isRuningLoop == false) {
          timer.cancel();
        }
      },
    );
  }
}
