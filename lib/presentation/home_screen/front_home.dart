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
import 'package:man_project/presentation/home_screen/front_widget/cloud_info.dart';
import 'package:man_project/presentation/widget_template.dart';
import 'package:man_project/domain/snake_move.dart';

class FrontHomeScreen extends StatefulWidget {
  @override
  _FrontHomeScreenState createState() => _FrontHomeScreenState();
}

class _FrontHomeScreenState extends State<FrontHomeScreen> {
  double widthBar = 220;

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

  // Container(
  //                 padding: EdgeInsets.only(top: 15),
  //                 alignment: Alignment.centerLeft,
  //                 width: double.infinity,
  //                 child: Container(
  // child: IconButton(
  //     iconSize: 30,
  //     icon: Icon(
  //       Icons.info_outline,
  //       color: Colors.lightGreen,
  //     ),
  //     onPressed: () {
  // if (GameState.isShowDialog) {
  //   GameState.isShowDialog = false;
  // } else if (!GameState.isShowDialog) {
  //   GameState.isShowDialog = true;
  // }
  //     }),
  //                 ),
  //               ),

  // width: widthBar * Xp.xpWhole,

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    var k = _height / _width;
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 120,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: 80,
                  decoration: BoxDecoration(
                    color: white,
                    border: Border.all(
                      width: 4,
                      color: blackWhite,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 18.0),
                  child: Container(
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: white,
                            shape: BoxShape.circle,
                            border: Border.all(width: 5, color: blackWhite),
                          ),
                          child: GestureDetector(
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
                              name: 'старт значок',
                              width: 50,
                              height: 50,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              '${Xp.xpFractional}Lvl',
                              style: TextStyle(
                                fontFamily: "VAG World",
                                fontSize: 20,
                                color: blackGreen,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Stack(
                              children: [
                                Container(
                                  height: 50,
                                  width: Xp.xpWhole * 100,
                                  decoration: BoxDecoration(
                                    color: green,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 4,
                                      color: blackGreen,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: white,
                            shape: BoxShape.circle,
                            border: Border.all(width: 5, color: blackWhite),
                          ),
                          // child: Container(
                          //   padding: EdgeInsets.fromLTRB(0, 0, 20, 20),
                          //   child: IconButton(
                          //       iconSize: 30,
                          //       icon: Icon(
                          //         Icons.info_outline,
                          //         color: Colors.lightGreen,
                          //       ),
                          // onPressed: () {
                          //   if (GameState.isShowDialog) {
                          //     GameState.isShowDialog = false;
                          //   } else if (!GameState.isShowDialog) {
                          //     GameState.isShowDialog = true;
                          //   }
                          // }),
                          // ),
                          child: GestureDetector(
                            onTap: () {
                              if (GameState.isShowDialog) {
                                GameState.isShowDialog = false;
                              } else if (!GameState.isShowDialog) {
                                GameState.isShowDialog = true;
                              }
                            },
                            child: Icon(
                              Icons.info_outline,
                              color: blackGreen,
                              size: 25,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        GameState.isShowDialog
            ? Container(
                width: _width,
                height: _width * k,
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: _height * 0.1, horizontal: _width * 0.1),
                      child: Stack(
                        children: [
                          backgroundImage(
                            name: 'хмарка інформації',
                            width: double.infinity,
                            height: double.infinity,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: _width * 0.1,
                                vertical: _height * 0.12),
                            child: TextInfo(),
                          ),
                          Positioned(
                            top: _height * 0.1,
                            right: _width * 0.05,
                            child: IconButton(
                                icon: Icon(
                                  Icons.cancel,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  if (GameState.isShowDialog) {
                                    GameState.isShowDialog = false;
                                  } else if (!GameState.isShowDialog) {
                                    GameState.isShowDialog = true;
                                  }
                                }),
                          ),
                        ],
                      ),
                    ),
                    backgroundImage(name: 'Морж', width: 230, height: 120),
                  ],
                ),
              )
            : SizedBox(),
      ],
    );
  }
}
