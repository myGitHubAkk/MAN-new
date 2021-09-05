import 'dart:async';

import 'package:flutter/material.dart';
import 'package:man_project/data/xp.dart';
import 'package:man_project/domain/xp_bloc.dart';
import 'package:man_project/entities/game_state.dart';
import 'package:man_project/presentation/game_screen/original_game_sreen.dart';
import 'package:man_project/presentation/widget_template.dart';
import 'package:man_project/domain/snake_move.dart';

class FrontHomeScreen extends StatefulWidget {
  // XpBloc xpBloc = XpBloc();

  // void addXp() {
  //   //xpBloc.inputEventSink.add(0.5);
  // }

  @override
  _FrontHomeScreenState createState() => _FrontHomeScreenState();
}

class _FrontHomeScreenState extends State<FrontHomeScreen> {
  double widthBar = 200;

  void _update() {
    Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState(() {});
    });
  }

  @override
  void initState() {
    SnakeMove.snakeMove();
    _update();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                GameState.gameReset();
                GameState.isGamePlay = true;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (contex) {
                    return OriginalGameScreen();
                  }),
                );
              },
              child:
                  backgroundImage(name: 'Кнопка Старта', width: 90, height: 90),
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
                    '${Xp.xpFractional}',
                    //'das',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    width: 10,
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
                          name: 'Рішотка шкали', width: widthBar, height: 25),
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
      ),
    );
  }
}
