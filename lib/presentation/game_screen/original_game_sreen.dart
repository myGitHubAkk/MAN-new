import 'package:flutter/material.dart';

class OriginalGameScreen extends StatefulWidget {
  const OriginalGameScreen({Key? key}) : super(key: key);

  @override
  _OriginalGameScreenState createState() => _OriginalGameScreenState();
}

class _OriginalGameScreenState extends State<OriginalGameScreen> {
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
                  // child: CustomPaint(painter: ,),
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
