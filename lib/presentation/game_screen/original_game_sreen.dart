import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class OriginalGameScreen extends StatefulWidget {
  const OriginalGameScreen({Key? key}) : super(key: key);

  @override
  _OriginalGameScreenState createState() => _OriginalGameScreenState();
}

class _OriginalGameScreenState extends State<OriginalGameScreen> {
  int lenghtRow = 20;
  static int sizeZone = 560;

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
              child: GestureDetector(
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
                      if (snakePosition.contains(index)) {
                        return cell(Colors.white);
                      }

                      if (index == apple) {
                        return cell(Colors.green);
                      }

                      return cell(Colors.grey[900]!);
                    },
                  ),
                ),
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
