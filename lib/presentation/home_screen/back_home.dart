import 'package:flutter/material.dart';

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
                  BackgroundImage(
                    name: 'Земля',
                    width: double.infinity,
                    height: double.infinity,
                  ),

                  fractionalXP < lvlWhichNotVisibleTreshLeft
                      ? MarginWidget(
                          top: 0,
                          left: 40,
                          widget: BackgroundImage(
                            name: 'Мусор',
                            width: 90,
                            height: 90,
                          ),
                        )
                      : Container(),

                  fractionalXP < lvlWhichNotVisibleTreshRight
                      ? MarginWidget(
                          top: 60,
                          left: 320,
                          widget: BackgroundImage(
                            name: 'Мусор',
                            width: 70,
                            height: 70,
                          ),
                        )
                      : Container(),
                  fractionalXP < lvlWhichNotVisibleFactory
                      ? MarginWidget(
                          top: 60,
                          left: 250,
                          widget: BackgroundImage(
                            name: 'Завод',
                            width: 70,
                            height: 70,
                          ),
                        )
                      : MarginWidget(
                          top: 0,
                          left: 250,
                          widget: Stack(
                            children: [
                              Positioned(
                                top: -20,
                                left: 0,
                                child: BackgroundImage(
                                  name: 'вітряк',
                                  width: 50,
                                  height: 120,
                                ),
                              ),
                              Positioned(
                                top: -30,
                                left: 50,
                                child: BackgroundImage(
                                  name: 'вітряк',
                                  width: 50,
                                  height: 120,
                                ),
                              ),
                              Positioned(
                                top: -30,
                                left: 100,
                                child: BackgroundImage(
                                  name: 'вітряк',
                                  width: 50,
                                  height: 120,
                                ),
                              )
                            ],
                          ),
                        ),

                  //річка
                  MarginWidget(top: 100, left: 0, widget: River(fractionalXP))
                ],
              ),
            )
          ],
        ),

        //грут
        Container(
          margin: EdgeInsets.only(top: 0),
          child: Center(
            child: Stack(
              children: [
                //тело
                Container(
                  height: 250,
                  width: 50,
                  color: green,
                ),
                //голова
                TreeFace(fractionalXP)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
