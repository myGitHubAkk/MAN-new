import 'dart:async';
import 'dart:isolate';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:man_project/const/colors.dart';
import 'package:man_project/domain/checking_answer.dart';
import 'package:man_project/domain/main_loop.dart';
import 'package:man_project/entities/game_state.dart';

import 'package:man_project/entities/snake.dart';
import 'package:man_project/entities/subjects/subject_width_answer.dart';
import 'package:man_project/entities/subjects/subjects.dart';
import 'package:man_project/domain/filed.dart';
import 'package:man_project/const/const_filled.dart';
import 'package:man_project/domain/snake_move.dart';
import 'package:man_project/entities/user_term.dart';
import 'package:man_project/presentation/home_screen/front_home.dart';
import 'package:man_project/presentation/home_screen/home_screen.dart';
import 'package:man_project/presentation/widget_template.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  double sizeFiled = 320;
  SnakeMove snakeMove = SnakeMove();
  UserTerm userTerm = UserTerm();

  List snake = Snake.snakePosition;
  bool isClash = SubjectWidthAnswer.isClash;
  bool isExit = false;

  late ReceivePort _receivePort;
  late Isolate _isolateLoop;

  void snakeUpdate() async {
    _receivePort = ReceivePort();
    _isolateLoop =
        await Isolate.spawn(MainLoop.startLoop, _receivePort.sendPort);
    _receivePort.listen((_) {
      if (isExit == false) {
        GameState.isGamePlay = false;
        setState(() {});
      }
      if (SubjectWidthAnswer.isClash == true &&
          GameState.isGamePause == false) {
        _showDialogQuestion();
        GameState.isGamePause = true;
      }

      if (GameState.isShowDialogGameOver == false &&
          GameState.isGamePause == false) {
        _showDialogGameOver();
        GameState.isGamePause = true;
      }

      if (GameState.isWinner == true && GameState.isGamePause == false) {
        _showDialogWinner();
        GameState.isGamePause = true;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    isExit = false;
    snakeUpdate();
  }

  void onPressedShowDialog() {
    GameState.isGamePause = false;
    Snake.isAddTail = true;
    SubjectWidthAnswer.isClash = false;
    Navigator.of(context).pop();
  }

  void _showDialogWinner() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text('перемога'),
          actions: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                // GameState.gameReset();
                isExit = true;
                GameState.isWinner = false;
                Navigator.pop(
                  context,
                  MaterialPageRoute(builder: (contex) {
                    return HomeScreen();
                  }),
                );
                //GameState.isGamePause = false;
                Navigator.of(context).pop();
              },
            ),
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                GameState.isWinner = false;
                GameState.gameReset();
                //GameState.isGamePause = false;
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showDialogGameOver() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actions: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                //GameState.gameReset();
                isExit = true;
                Navigator.pop(
                  context,
                  MaterialPageRoute(builder: (contex) {
                    return HomeScreen();
                  }),
                );
                //GameState.isGamePause = false;
                Navigator.of(context).pop();
              },
            ),
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                GameState.gameReset();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showDialogQuestion() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        SubjectWidthAnswer.randomNextAnswer();
        return AlertDialog(
          content: Text(
            SubjectWidthAnswer().answer,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.green[800]),
          ),
          actions: [
            Container(
              width: 350,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      onPressedShowDialog();
                      CheckingAnswer().addUserVersion = true;
                    },
                    child: backgroundImage(name: 'Yes', width: 50, height: 50),
                  ),
                  GestureDetector(
                    onTap: () {
                      onPressedShowDialog();
                      CheckingAnswer().addUserVersion = false;
                    },
                    child: backgroundImage(name: 'X', width: 50, height: 50),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    final heightScreen = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: skyColor,
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 0, vertical: heightScreen * 0.07),
                child: Container(
                  width: widthScreen,
                  child: Stack(
                    children: [
                      backgroundImage(
                        name: 'хмарка терміна',
                        width: double.infinity,
                        height: double.infinity,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: widthScreen * 0.15,
                          vertical: heightScreen * 0.04,
                        ),
                        child: Container(
                          child: UserTerm().widget,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Stack(
                children: [
                  Transform.scale(
                    scale: widthScreen * 0.003,
                    child: Image.asset(
                      'assets/img/холм.png',
                      width: widthScreen,
                      height: heightScreen * 0.6,
                    ),
                  ),
                  Center(
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: backgroundImage(
                            name: 'поле',
                            width: sizeFiled,
                            height: sizeFiled * 9 / 8,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          width: sizeFiled,
                          height: sizeFiled * 9 / 8,
                          child: GestureDetector(
                            onVerticalDragUpdate: (details) {
                              final _details = details.delta.dy;

                              if (Snake.snakeDirection != SnakeDirection.up &&
                                  _details > 0) {
                                Snake.snakeDirection = SnakeDirection.down;
                                snakeMove.snakeDirection(Snake.snakeDirection);
                                // snakeDirectionBloc.inputEventSink.add(Snake.snakeDirection);
                              } else if (Snake.snakeDirection !=
                                      SnakeDirection.down &&
                                  _details < 0) {
                                Snake.snakeDirection = SnakeDirection.up;
                                snakeMove.snakeDirection(Snake.snakeDirection);
                                // snakeMoveBloc.inputEventSink.add(Snake.snakeDirection);
                              }
                            },
                            onHorizontalDragUpdate: (details) {
                              if (GameState.isShowDialogGameOver == true) {
                                if (Snake.snakeDirection !=
                                        SnakeDirection.left &&
                                    details.delta.dx > 0) {
                                  Snake.snakeDirection = SnakeDirection.right;
                                  snakeMove
                                      .snakeDirection(Snake.snakeDirection);
                                  // snakeMoveBloc.inputEventSink.add(Snake.snakeDirection);
                                } else if (Snake.snakeDirection !=
                                        SnakeDirection.right &&
                                    details.delta.dx < 0) {
                                  Snake.snakeDirection = SnakeDirection.left;
                                  snakeMove
                                      .snakeDirection(Snake.snakeDirection);
                                  // snakeMoveBloc.inputEventSink.add(Snake.snakeDirection);
                                }
                              } else {
                                Snake.snakeDirection = SnakeDirection.down;
                                snakeMove.snakeDirection(Snake.snakeDirection);
                              }
                            },
                            child: Container(
                              child: GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: sizeFieldPlay,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
