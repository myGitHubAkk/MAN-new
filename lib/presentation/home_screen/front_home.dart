import 'dart:async';
import 'dart:isolate';

import 'package:flutter/material.dart';
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
  double widthBar = 200;
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
                  child: IconButton(
                      icon: Icon(
                        Icons.info_outline,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        _showDialog();
                      }),
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
                            name: 'Кнопка Старта', width: 90, height: 90),
                      ),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                  width: widthBar + 70,
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        // '${fractionalXP} Lvl',
                        //'${_xp['fractional']!} Lvl',
                        '${Xp.xpFractional} LvL',
                        //'das',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        width: 0,
                      ),
                      Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            width: widthBar - 20,
                            height: 25,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            // width: widthBar * wholeXP,
                            //width: widthBar * _xp['whole']!,
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

                // StreamBuilder(
                //   stream: widget.xpBloc.outputStateStream,
                //   initialData: Xp.xp,
                //   builder: (_, snapshot) {
                //     Map _xp = snapshot.data as Map;
                //     print(snapshot.data as Map);
                //     return Container(
                //       padding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                //       width: widthBar + 70,
                //       child: Row(
                //         //mainAxisAlignment: MainAxisAlignment.start,
                //         crossAxisAlignment: CrossAxisAlignment.center,
                //         children: [
                //           Text(
                //             // '${fractionalXP} Lvl',
                //             '${_xp['fractional']!} Lvl',
                //             //'das',
                //             style: TextStyle(fontSize: 20),
                //           ),
                //           SizedBox(
                //             width: 10,
                //           ),
                //           Stack(
                //             children: [
                //               Container(
                //                 margin: EdgeInsets.only(left: 10),
                //                 width: widthBar - 20,
                //                 height: 25,
                //                 decoration: BoxDecoration(
                //                   color: Colors.white,
                //                   borderRadius: BorderRadius.circular(50),
                //                 ),
                //               ),
                //               Container(
                //                 margin: EdgeInsets.only(left: 10),
                //                 // width: widthBar * wholeXP,
                //                 width: widthBar * _xp['whole']!,
                //                 //width: widthBar,
                //                 height: 25,
                //                 decoration: BoxDecoration(
                //                   color: Colors.green,
                //                   borderRadius: BorderRadius.circular(50),
                //                 ),
                //               ),
                //               backgroundImage(
                //                   name: 'Рішотка шкали', width: widthBar, height: 25),
                //             ],
                //           ),
                //         ],
                //       ),
                //     );
                //   },
                // )
              ],
            ),
            _isShowDialog
                ? Container(
                    child: Stack(
                      children: [
                        Container(
                          width: _width * 0.9,
                          height: _height * 0.9,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/img/хмарка інформації.png'),
                            ),
                          ),
                          child: Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: _height * 0.15,
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
                                bottom: _height * 0.12,
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
                          top: _height * 0.1,
                          right: _width * 0.05,
                          child: IconButton(
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
