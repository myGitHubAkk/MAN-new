import 'package:man_project/const/constFilled.dart';
import 'package:man_project/domain/snake_move.dart';
import 'package:man_project/entities/snake.dart';
import 'package:man_project/entities/subjects/apple.dart';
import 'package:man_project/entities/subjects/subjects.dart';
import 'package:man_project/entities/user_term.dart';

class GameState {
  static bool isWinner = false;
  static bool isGamePause = false;
  static bool isGameOn = true;

  static void gameReset() {
    isGameOn = true;
    isGamePause = false;
    UserTerm.valueUserTerm = '';
    Snake.snakeDirection = SnakeDirection.down;
    SnakeMove().snakeDirection(Snake.snakeDirection);
    print(Snake.snakeDirection);
    Snake.snakePosition = [
      tailPosition,
      tailPosition + lenghtRow,
      tailPosition + lenghtRow * 2,
      tailPosition + lenghtRow * 3,
    ];

    for (var subject in Subjects.subjects) {
      subject.gameOver();
    }
  }
}
