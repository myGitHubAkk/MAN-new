import 'package:man_project/const/const_filled.dart';
import 'package:man_project/domain/snake_move.dart';
import 'package:man_project/entities/snake.dart';
import 'package:man_project/entities/subjects/subject_width_answer.dart';
import 'package:man_project/entities/subjects/subjects.dart';
import 'package:man_project/entities/user_term.dart';

class GameState {
  static bool isWinner = false;
  static bool isGamePause = false;
  static bool isShowDialogGameOver = true;
  static bool isGamePlay = false;

  static bool isShowDialog = true;

  static void gameReset() {
    isShowDialogGameOver = true;
    isGamePause = false;

    UserTerm.valueUserTerm = '';
    UserTerm.namberWord = 0;

    Snake.snakeDirection = SnakeDirection.down;
    SnakeMove().snakeDirection(Snake.snakeDirection);
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
