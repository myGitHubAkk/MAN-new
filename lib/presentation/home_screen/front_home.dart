import 'dart:async';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:man_project/const/colors.dart';
import 'package:man_project/const/value_widget_visibility.dart';
import 'package:man_project/data/xp.dart';
import 'package:man_project/domain/main_loop.dart';
import 'package:man_project/domain/xp_bloc.dart';
import 'package:man_project/entities/game_state.dart';
import 'package:man_project/presentation/game_screen/game_sreen.dart';
import 'package:man_project/presentation/widget_template.dart';
import 'package:man_project/domain/snake_move.dart';

class FrontHomeScreen extends StatefulWidget {
  @override
  _FrontHomeScreenState createState() => _FrontHomeScreenState();
}

class _FrontHomeScreenState extends State<FrontHomeScreen> {
  double widthBar = 220;
  bool _isShowDialog = true;

  late ReceivePort _receivePort;
  late Isolate _isolateLoop;

  void _update() async {
    _receivePort = ReceivePort();
    _isolateLoop =
        await Isolate.spawn(MainLoop.startLoop, _receivePort.sendPort);
    _receivePort.listen((_) {
      setState(() {});
    });
  }

  @override
  void initState() {
    SnakeMove.snakeMove();
    _update();
    super.initState();
  }

  void _showDialog() {
    setState(() {
      _isShowDialog = !_isShowDialog;
    });
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 15),
                  alignment: Alignment.centerLeft,
                  width: double.infinity,
                  child: Container(
                    child: IconButton(
                        iconSize: 30,
                        icon: Icon(
                          Icons.info_outline,
                          color: Colors.lightGreen,
                        ),
                        onPressed: () {
                          _showDialog();
                        }),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Xp.xpFractional == treeHappinessLvl['Very very happy']
                        ? SizedBox()
                        : GestureDetector(
                            onTap: () {
                              GameState.gameReset();
                              GameState.isGamePlay = true;
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (contex) {
                                  return GameScreen();
                                }),
                              );
                            },
                            child: backgroundImage(
                                name: 'Кнопка Старта', width: 110, height: 110),
                          ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                      width: widthBar + 70,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              '${Xp.xpFractional} LvL',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: blackBrown),
                            ),
                          ),
                          // SizedBox(
                          //   width: 0,
                          // ),
                          Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 5),
                                width: widthBar - 20,
                                height: 25,
                                decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 5),
                                width: widthBar * Xp.xpWhole,
                                height: 25,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              backgroundImage(
                                  name: 'Рішотка шкали',
                                  width: widthBar,
                                  height: 25),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
            _isShowDialog
                ? Container(
                    child: Stack(
                      children: [
                        Container(
                          width: _width * 0.9,
                          height: _height * 0.8,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                  'assets/img/хмарка інформації.png'),
                            ),
                          ),
                          child: Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: _height * 0.09,
                                  horizontal: _width * 0.12,
                                ),
                                child: Text(
                                    '''asd assets/i mg/хмарка інф ормації.png asset s/ img/хмарка 
                                    інформації.png assets/img/хмарка інформації.png assets/img/хмарка інформації.png
                                    інформації.png assets/img/хмарка інформації.png assets/img/хмарка інформації.png
                                    інформації.png assets/img/хмарка інформації.png assets/img/хмарка інформації.png
                                    інформації.png assets/img/хмарка інформації.png assets/img/хмарка інформації.png
                                    інформації.png assets/img/хмарка інформації.png assets/img/хмарка інформації.png
                                    '''),
                              ),
                              Positioned(
                                bottom: _height * 0.05,
                                child: Container(
                                  width: _width * 0.9,
                                  height: 110,
                                  child: Image.asset('assets/img/спить.png'),
                                ),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          top: _height * 0.05,
                          right: _width * 0.05,
                          child: IconButton(
                              iconSize: 30,
                              icon: Icon(
                                Icons.cancel,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                _showDialog();
                              }),
                        ),
                      ],
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
