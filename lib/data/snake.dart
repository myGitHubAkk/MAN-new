import 'package:man_project/const/constFilled.dart';

class Snake {
  static List<int> snakePosition = [
    tailPosition,
    tailPosition + lenghtRow,
    tailPosition + lenghtRow * 2,
    tailPosition + lenghtRow * 3,
  ];

  static bool isGameOn = true;

  static void gameOver() {
    isGameOn = false;
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
