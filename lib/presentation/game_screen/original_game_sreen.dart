import 'dart:async';

import 'package:flutter/material.dart';

import 'package:man_project/data/snake.dart';
import 'package:man_project/data/subjects.dart';
import 'package:man_project/domain/snake_move.dart';
import 'package:man_project/const/constFilled.dart';

class OriginalGameScreen extends StatefulWidget {
  const OriginalGameScreen({Key? key}) : super(key: key);

  @override
  _OriginalGameScreenState createState() => _OriginalGameScreenState();
}

class _OriginalGameScreenState extends State<OriginalGameScreen> {
  SnakeMoveBloc snakeMoveBloc = SnakeMoveBloc();
  SnakeDirection snakeDirection = SnakeDirection.down;

  var snake = Snake.snakePosition;

  void snakeUpdate() {
    Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState(() {
        // snake = Snake.snakePosition;
      });
    });
  }
  // static List<int> snakePosition = [25, 45, 65, 85];

  // static var randomNamber = Random();
  // int apple = randomNamber.nextInt(sizeFieldPlay);
  // void generateNewApple() {
  //   apple = randomNamber.nextInt(sizeFieldPlay);
  // }

  // var direction = 'down';

  // void _showGameOverScreen() {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('Game Over траляля'),
  //         content: Text(
  //           'ти просрав з щотом:' + snakePosition.length.toString(),
  //         ),
  //         actions: <Widget>[
  //           TextButton(
  //             onPressed: () {
  //               setState(() {});
  //               startGame();
  //               Navigator.of(context).pop();
  //             },
  //             child: Text('Дубль 2'),
  //           )
  //         ],
  //       );
  //     },
  //   );
  // }

  @override
  void initState() {
    super.initState();
    snakeUpdate();
  }

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width * 0.8;
    final heightScreen = MediaQuery.of(context).size.height * 0.65;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 120,
            ),
            Container(
              width: widthScreen,
              height: heightScreen,
              child: GestureDetector(
                onVerticalDragUpdate: (details) {
                  if (snakeDirection != SnakeDirection.up &&
                      details.delta.dy > 0) {
                    setState(() {
                      snakeDirection = SnakeDirection.down;
                    });
                    snakeMoveBloc.inputEventSink.add(snakeDirection);
                  } else if (snakeDirection != SnakeDirection.down &&
                      details.delta.dy < 0) {
                    setState(() {
                      snakeDirection = SnakeDirection.up;
                    });
                    snakeMoveBloc.inputEventSink.add(snakeDirection);
                  }
                },
                onHorizontalDragUpdate: (details) {
                  if (snakeDirection != SnakeDirection.left &&
                      details.delta.dx > 0) {
                    setState(() {
                      snakeDirection = SnakeDirection.right;
                    });
                    snakeMoveBloc.inputEventSink.add(snakeDirection);
                  } else if (snakeDirection != SnakeDirection.right &&
                      details.delta.dx < 0) {
                    setState(() {
                      snakeDirection = SnakeDirection.left;
                    });
                    snakeMoveBloc.inputEventSink.add(snakeDirection);
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
                        if (Snake.snakePosition.contains(index)) {
                          return Snake.snake;
                        }

                        if (index == Subjects.subjects['stone']!.position) {
                          return Subjects.subjects['stone']!.widget;
                        }

                        // if (index == apple) {
                        //   return cell(Colors.green);
                        // }

                        return cellTemlate(
                            colorLight: Colors.white, colorDark: Colors.grey);
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget cell(Widget widget) {
//   return Container(
//     padding: EdgeInsets.all(2),
//     child: ClipRRect(borderRadius: BorderRadius.circular(5), child: widget),
//   );
// }
