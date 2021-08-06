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
  static List<int> snakePosition = [25, 45, 65, 85];

  static var randomNamber = Random();
  int apple = randomNamber.nextInt(sizeZone);
  void generateNewApple() {
    apple = randomNamber.nextInt(sizeZone);
  }

  void startGame() {
    snakePosition = [25, 45, 65, 85];
    const duration = const Duration(milliseconds: 300);
    /* двіженіє змєйки яке насправді є дестройом хвоста і доб голови */
    Timer.periodic(duration, (Timer timer) {
      snakeUpdate();
      if (isGameOver()) {
        timer.cancel();
        _showGameOverScreen();
      }
    });
  }

  var direction = 'down';
  void snakeUpdate() {
    setState(() {
      switch (direction) {
        case 'down':
          if (snakePosition.last > sizeZone - lenghtRow) {
            snakePosition.add(snakePosition.last + lenghtRow - sizeZone);
          } else {
            snakePosition.add(snakePosition.last + lenghtRow);
          }
          break;

        case 'up':
          if (snakePosition.last < lenghtRow) {
            snakePosition.add(snakePosition.last - lenghtRow - sizeZone);
          } else {
            snakePosition.add(snakePosition.last - lenghtRow);
          }
          break;

        case 'left':
          if (snakePosition.last % lenghtRow == 0) {
            snakePosition.add(snakePosition.last - 1 + lenghtRow);
          } else {
            snakePosition.add(snakePosition.last - 1);
          }
          break;

        case 'right':
          if ((snakePosition.last + 1) % lenghtRow == 0) {
            snakePosition.add(snakePosition.last + 1 - lenghtRow);
          } else {
            snakePosition.add(snakePosition.last + 1);
          }
          break;

        default:
      }

      if (snakePosition.last == apple) {
        generateNewApple();
      } else {
        snakePosition.removeAt(0);
      }
    });
  }

  bool isGameOver() {
    for (var i = 0; i < snakePosition.length; i++) {
      int count = 0;
      for (var j = 0; j < snakePosition.length; j++) {
        if (snakePosition[i] == snakePosition[j]) {
          count += 1;
        }
        if (count == 2) {
          return true;
        }
      }
    }

    return false;
  }

  void _showGameOverScreen() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Game Over траляля'),
          content: Text(
            'ти просрав з щотом:' + snakePosition.length.toString(),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                setState(() {});
                startGame();
                Navigator.of(context).pop();
              },
              child: Text('Дубль 2'),
            )
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startGame();
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
              child: GestureDetector(
                onVerticalDragUpdate: (details) {
                  if (direction != 'up' && details.delta.dy > 0) {
                    setState(() {
                      direction = 'down';
                    });
                  } else if (direction != 'down' && details.delta.dy < 0) {
                    setState(() {
                      direction = 'up';
                    });
                  }
                },
                onHorizontalDragUpdate: (details) {
                  if (direction != 'left' && details.delta.dx > 0) {
                    setState(() {
                      direction = 'right';
                    });
                  } else if (direction != 'right' && details.delta.dx < 0) {
                    setState(() {
                      direction = 'left';
                    });
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
