import 'package:flutter/material.dart';
import 'package:man_project/const/value_widget_visibility.dart';
import 'package:man_project/data/xp.dart';
import 'package:man_project/presentation/home_screen/back_widget/cloud.dart';
import 'package:man_project/presentation/home_screen/back_widget/destroying_objects.dart';
import 'package:man_project/presentation/home_screen/back_widget/river.dart';
import 'package:man_project/presentation/widget_template.dart';

import 'back_widget/changing_objects_ in_back.dart';

class BackHomeScreen extends StatefulWidget {
  const BackHomeScreen({Key? key}) : super(key: key);

  @override
  _BackHomeScreenState createState() => _BackHomeScreenState();
}

class _BackHomeScreenState extends State<BackHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //decoration:
      //    BoxDecoration(border: Border.all(color: Colors.red, width: 3)),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            //decoration: BoxDecoration(
            //border: Border.all(color: Colors.green, width: 3)),
            child: backgroundImage(
              name: 'Земля нова',
              width: double.infinity,
              height: 335,
            ),
          ),
          Container(
            //decoration: BoxDecoration(
            //    border: Border.all(color: Colors.yellow, width: 3)),
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Positioned(
                        top: 80,
                        left: 10,
                        child: Cloud(),
                      ),
                      Positioned(
                        top: 10,
                        left: 140,
                        child: Cloud(),
                      ),
                      Positioned(
                        top: 50,
                        left: 280,
                        child: Cloud(),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      DestroyingObjects(
                        top: 230.0,
                        left: 30.0,
                        valueVisibility: lvlWhichNotVisibleTreshLeft,
                      ),
                      DestroyingObjects(
                        top: 240.0,
                        left: 300.0,
                        valueVisibility: lvlWhichNotVisibleTreshLeft,
                      ),
                      DestroyingObjects(
                        top: 230.0,
                        left: 30.0,
                        valueVisibility: lvlWhichNotVisibleFactory,
                      ),
                      // Xp.xpFractional < lvlWhichNotVisibleTreshLeft
                      //     ? marginWidget(
                      //         top: 0,
                      //         left: 40,
                      //         widget: backgroundImage(
                      //           name: 'Мусор',
                      //           width: 90,
                      //           height: 90,
                      //         ),
                      //       )
                      //     : Container(),
                      // Xp.xpFractional < lvlWhichNotVisibleTreshRight
                      //     ? marginWidget(
                      //         top: 60,
                      //         left: 320,
                      //         widget: backgroundImage(
                      //           name: 'Мусор',
                      //           width: 70,
                      //           height: 70,
                      //         ),
                      //       )
                      //     : Container(),
                      // Xp.xpFractional < lvlWhichNotVisibleFactory
                      //     ? marginWidget(
                      //         top: 60,
                      //         left: 250,
                      //         widget: backgroundImage(
                      //           name: 'Завод',
                      //           width: 70,
                      //           height: 70,
                      //         ),
                      //       )
                      //     : marginWidget(
                      //         top: 0,
                      //         left: 250,
                      //         widget: Stack(
                      //           children: [
                      //             Positioned(
                      //               top: -20,
                      //               left: 0,
                      //               child: backgroundImage(
                      //                 name: 'вітряк',
                      //                 width: 50,
                      //                 height: 120,
                      //               ),
                      //             ),
                      //             Positioned(
                      //               top: -30,
                      //               left: 50,
                      //               child: backgroundImage(
                      //                 name: 'вітряк',
                      //                 width: 50,
                      //                 height: 120,
                      //               ),
                      //             ),
                      //             Positioned(
                      //               top: -30,
                      //               left: 100,
                      //               child: backgroundImage(
                      //                 name: 'вітряк',
                      //                 width: 50,
                      //                 height: 120,
                      //               ),
                      //             )
                      //           ],
                      //         ),
                      //       ),
                    ],
                  ),
                ),

                Expanded(
                  child: marginWidget(
                    top: 100,
                    left: 0,
                    widget: River(),
                  ),
                ),
                //хмарки
                //   Expanded(
                //     flex: 2,
                //     child: Stack(
                //       children: [
                //         Positioned(
                //           top: 80,
                //           left: 10,
                //           child: Cloud(),
                //         ),
                //         Positioned(
                //           top: 10,
                //           left: 140,
                //           child: Cloud(),
                //         ),
                //         Positioned(
                //           top: 50,
                //           left: 280,
                //           child: Cloud(),
                //         ),
                //       ],
                //     ),
                //   ),
                //   //поле
                //   Expanded(
                //     flex: 3,
                //     child: Stack(
                //       children: [
                //         backgroundImage(
                //           name: 'Земля',
                //           width: double.infinity,
                //           height: double.infinity,
                //         ),

                //         Xp.xpFractional < lvlWhichNotVisibleTreshLeft
                //             ? marginWidget(
                //                 top: 0,
                //                 left: 40,
                //                 widget: backgroundImage(
                //                   name: 'Мусор',
                //                   width: 90,
                //                   height: 90,
                //                 ),
                //               )
                //             : Container(),

                //         Xp.xpFractional < lvlWhichNotVisibleTreshRight
                //             ? marginWidget(
                //                 top: 60,
                //                 left: 320,
                //                 widget: backgroundImage(
                //                   name: 'Мусор',
                //                   width: 70,
                //                   height: 70,
                //                 ),
                //               )
                //             : Container(),
                //         Xp.xpFractional < lvlWhichNotVisibleFactory
                //             ? marginWidget(
                //                 top: 60,
                //                 left: 250,
                //                 widget: backgroundImage(
                //                   name: 'Завод',
                //                   width: 70,
                //                   height: 70,
                //                 ),
                //               )
                //             : marginWidget(
                //                 top: 0,
                //                 left: 250,
                //                 widget: Stack(
                //                   children: [
                //                     Positioned(
                //                       top: -20,
                //                       left: 0,
                //                       child: backgroundImage(
                //                         name: 'вітряк',
                //                         width: 50,
                //                         height: 120,
                //                       ),
                //                     ),
                //                     Positioned(
                //                       top: -30,
                //                       left: 50,
                //                       child: backgroundImage(
                //                         name: 'вітряк',
                //                         width: 50,
                //                         height: 120,
                //                       ),
                //                     ),
                //                     Positioned(
                //                       top: -30,
                //                       left: 100,
                //                       child: backgroundImage(
                //                         name: 'вітряк',
                //                         width: 50,
                //                         height: 120,
                //                       ),
                //                     )
                //                   ],
                //                 ),
                //               ),

                //         //річка
                // marginWidget(
                //     top: 100, left: 0, widget: River(Xp.xpFractional))
                //       ],
                //     ),
                //   )
              ],
            ),
          ),

          //грут
          // Container(
          //   margin: EdgeInsets.only(top: 0),
          //   child: Center(
          //     child: Stack(
          //       children: [
          //         //тело
          //         Container(
          //           height: 250,
          //           width: 50,
          //           color: green,
          //         ),
          //         //голова
          //         TreeFace(Xp.xpFractional)
          //       ],
          //     ),
          //   ),
          //),
        ],
      ),
    );
  }
}
