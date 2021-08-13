import 'dart:async';

import 'package:flutter/material.dart';
import 'package:man_project/data/snake.dart';
import 'package:man_project/domain/SnakeBloc.dart';

class OriginalGameScreen extends StatefulWidget {
  const OriginalGameScreen({Key? key}) : super(key: key);

  @override
  _OriginalGameScreenState createState() => _OriginalGameScreenState();
}

class _OriginalGameScreenState extends State<OriginalGameScreen> {
  int lenghtRow = 20;
  static int sizeZone = 560;

  SnakeBloc snakeBloc = SnakeBloc();
  SnakeDirection snakeDirection = SnakeDirection.down;

  var snake = Snake.snakePosition;

  void snakeUpdate() {
    Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState(() {
        snake = Snake.snakePosition;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    snakeUpdate();
  }

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    final sizeCanvas = widthScreen * 0.8;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 20,
            ),
            Container(
              width: sizeCanvas,
              height: sizeCanvas,
              child: StreamBuilder(
                builder: (_, snapshot) {
                  return GestureDetector(
                    onVerticalDragUpdate: (details) {
                      if (snakeDirection != SnakeDirection.up &&
                          details.delta.dy > 0) {
                        setState(() {
                          snakeDirection = SnakeDirection.down;
                        });
                        snakeBloc.inputEventSink.add(snakeDirection);
                      } else if (snakeDirection != SnakeDirection.down &&
                          details.delta.dy < 0) {
                        setState(() {
                          snakeDirection = SnakeDirection.up;
                        });
                        snakeBloc.inputEventSink.add(snakeDirection);
                      }
                    },
                    onHorizontalDragUpdate: (details) {
                      if (snakeDirection != SnakeDirection.left &&
                          details.delta.dx > 0) {
                        setState(() {
                          snakeDirection = SnakeDirection.right;
                        });
                        snakeBloc.inputEventSink.add(snakeDirection);
                      } else if (snakeDirection != SnakeDirection.right &&
                          details.delta.dx < 0) {
                        setState(() {
                          snakeDirection = SnakeDirection.left;
                        });
                        snakeBloc.inputEventSink.add(snakeDirection);
                      }
                    },
                    child: Container(
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: sizeZone,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: lenghtRow,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          if (Snake.snakePosition.contains(index)) {
                            return Container(
                              color: Colors.white,
                            );
                          }

                          // if (index == apple) {
                          //   return cell(Colors.green);
                          // }

                          return Container(
                            color: Colors.grey[900],
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

Widget cell(Color color) {
  return Container(
    padding: EdgeInsets.all(2),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        color: color,
      ),
    ),
  );
}
