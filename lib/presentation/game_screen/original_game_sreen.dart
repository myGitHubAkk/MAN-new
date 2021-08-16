import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:man_project/domain/checking_answer.dart';
import 'package:man_project/entities/game_state.dart';

import 'package:man_project/entities/snake.dart';
import 'package:man_project/entities/subjects.dart';
import 'package:man_project/domain/filed.dart';
import 'package:man_project/const/constFilled.dart';
import 'package:man_project/domain/snake_move.dart';
import 'package:man_project/entities/user_term.dart';

class OriginalGameScreen extends StatefulWidget {
  const OriginalGameScreen({Key? key}) : super(key: key);

  @override
  _OriginalGameScreenState createState() => _OriginalGameScreenState();
}

class _OriginalGameScreenState extends State<OriginalGameScreen> {
  SnakeMove snakeMove = SnakeMove();
  UserTerm userTerm = UserTerm();

  var snake = Snake.snakePosition;
  var isClash = AppleWithWords.isClash;

  bool _isAddWord = false;

  void snakeUpdate() {
    Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState(() {});
      if (AppleWithWords.isClash == true && GameState.isGamePause == false) {
        _showDialog();
        GameState.isGamePause = true;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    snakeUpdate();
  }

  void onPressedShowDialog(String answer) {
    GameState.isGamePause = false;
    AppleWithWords.isClash = false;
    Navigator.of(context).pop();
    _isAddWord = CheckingAnswer().isTrueAnswer;
    if (_isAddWord) {
      UserTerm().addValue = answer;
      print('add');
    }
    // print(_isAddWord);
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        List values = UserTerm.term.values;
        int index = Random().nextInt(values.length);
        String _answer = values[index];
        return AlertDialog(
          content: Text(_answer),
          actions: [
            IconButton(
              icon: Icon(Icons.check),
              onPressed: () {
                onPressedShowDialog(_answer);
              },
            ),
            IconButton(
              icon: Icon(Icons.cancel),
              onPressed: () {
                onPressedShowDialog(_answer);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width * 0.8;
    final heightScreen = MediaQuery.of(context).size.height * 0.65;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 20,
              ),
              Container(
                height: heightScreen / 3,
                width: widthScreen,
                child: UserTerm().widget,
              ),
              Container(
                width: widthScreen,
                height: heightScreen,
                child: GestureDetector(
                  onVerticalDragUpdate: (details) {
                    if (Snake.snakeDirection != SnakeDirection.up &&
                        details.delta.dy > 0) {
                      Snake.snakeDirection = SnakeDirection.down;
                      snakeMove.snakeDirection(Snake.snakeDirection);
                      // snakeDirectionBloc.inputEventSink.add(Snake.snakeDirection);
                    } else if (Snake.snakeDirection != SnakeDirection.down &&
                        details.delta.dy < 0) {
                      Snake.snakeDirection = SnakeDirection.up;
                      snakeMove.snakeDirection(Snake.snakeDirection);
                      // snakeMoveBloc.inputEventSink.add(Snake.snakeDirection);
                    }
                  },
                  onHorizontalDragUpdate: (details) {
                    if (Snake.snakeDirection != SnakeDirection.left &&
                        details.delta.dx > 0) {
                      Snake.snakeDirection = SnakeDirection.right;
                      snakeMove.snakeDirection(Snake.snakeDirection);
                      // snakeMoveBloc.inputEventSink.add(Snake.snakeDirection);
                    } else if (Snake.snakeDirection != SnakeDirection.right &&
                        details.delta.dx < 0) {
                      Snake.snakeDirection = SnakeDirection.left;
                      snakeMove.snakeDirection(Snake.snakeDirection);
                      // snakeMoveBloc.inputEventSink.add(Snake.snakeDirection);
                    }
                  },
                  child: Container(
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: sizeFieldPlay,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: lenghtRow,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        Field collision = Field(index);
                        return collision.widget;
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
