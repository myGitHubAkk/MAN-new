import 'package:flutter/material.dart';
import 'package:man_project/const/value_widget_visibility.dart';
import 'package:man_project/data/xp.dart';
import 'package:man_project/presentation/widget_template.dart';

import 'back_widget/cloud.dart';

class BackHomeScreen extends StatefulWidget {
  const BackHomeScreen({Key? key}) : super(key: key);

  @override
  _BackHomeScreenState createState() => _BackHomeScreenState();
}

class _BackHomeScreenState extends State<BackHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            //хмарки
            Expanded(
              flex: 2,
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
            //поле
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  backgroundImage(
                    name: 'Земля',
                    width: double.infinity,
                    height: double.infinity,
                  ),

                  Xp.xpFractional < lvlWhichNotVisibleTreshLeft
                      ? marginWidget(
                          top: 0,
                          left: 40,
                          widget: backgroundImage(
                            name: 'Мусор',
                            width: 90,
                            height: 90,
                          ),
                        )
                      : Container(),

                  Xp.xpFractional < lvlWhichNotVisibleTreshRight
                      ? marginWidget(
                          top: 60,
                          left: 320,
                          widget: backgroundImage(
                            name: 'Мусор',
                            width: 70,
                            height: 70,
                          ),
                        )
                      : Container(),
                  Xp.xpFractional < lvlWhichNotVisibleFactory
                      ? marginWidget(
                          top: 60,
                          left: 250,
                          widget: backgroundImage(
                            name: 'Завод',
                            width: 70,
                            height: 70,
                          ),
                        )
                      : marginWidget(
                          top: 0,
                          left: 250,
                          widget: Stack(
                            children: [
                              Positioned(
                                top: -20,
                                left: 0,
                                child: backgroundImage(
                                  name: 'вітряк',
                                  width: 50,
                                  height: 120,
                                ),
                              ),
                              Positioned(
                                top: -30,
                                left: 50,
                                child: backgroundImage(
                                  name: 'вітряк',
                                  width: 50,
                                  height: 120,
                                ),
                              ),
                              Positioned(
                                top: -30,
                                left: 100,
                                child: backgroundImage(
                                  name: 'вітряк',
                                  width: 50,
                                  height: 120,
                                ),
                              )
                            ],
                          ),
                        ),

                  //річка
                  // marginWidget(
                  //     top: 100, left: 0, widget: River(Xp.xpFractional))
                ],
              ),
            )
          ],
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
    );
  }
}
