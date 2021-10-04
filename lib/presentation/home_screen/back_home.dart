import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:man_project/const/value_widget_visibility.dart';
import 'package:man_project/data/xp.dart';
import 'package:man_project/domain/main_loop.dart';
import 'package:man_project/presentation/home_screen/back_widget/cloud.dart';
import 'package:man_project/presentation/home_screen/back_widget/destroying_objects.dart';
import 'package:man_project/presentation/home_screen/back_widget/river.dart';
import 'package:man_project/presentation/home_screen/back_widget/template/back_widget_template.dart';
import 'package:man_project/presentation/home_screen/back_widget/tree.dart';
import 'package:man_project/presentation/home_screen/back_widget/tree_face.dart';
import 'package:man_project/presentation/widget_template.dart';

import 'back_widget/template/changing_objects_ in_back.dart';

class BackHomeScreen extends StatefulWidget {
  const BackHomeScreen({Key? key}) : super(key: key);

  @override
  _BackHomeScreenState createState() => _BackHomeScreenState();
}

class _BackHomeScreenState extends State<BackHomeScreen> {
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
    _update();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _widthScreen = MediaQuery.of(context).size.width;
    double _heightScreen = MediaQuery.of(context).size.height;

    var k = _heightScreen / _widthScreen;
    return Container(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: _widthScreen * k * 0.5,
            width: _widthScreen,
            child: Image.asset(
              'assets/img/Земля.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          // Container(
          //   child: backgroundImage(
          //     name: 'Земля нова',
          //     width: double.infinity,
          //     height: 335,
          //   ),
          // ),
          Container(
            child: Stack(
              alignment: Alignment.center,
              children: [
                DestroyingObjects(
                  top: 40.0,
                  left: 170.0,
                  valueVisibility: lvlWhichNotVisibleFactory,
                ),
                Column(
                  children: [
                    Expanded(
                      // child: Container(
                      //   decoration: BoxDecoration(
                      //       border: Border.all(color: Colors.blue, width: 3)),
                      child: Stack(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Cloud(
                                top: 110.0,
                                left: 10.0,
                              ),
                              Cloud(
                                top: 0.0,
                                left: 15.0,
                              ),
                              Cloud(
                                top: 50.0,
                                left: 20.0,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    //),
                    Expanded(
                      // child: Container(
                      //   decoration: BoxDecoration(
                      //       border: Border.all(color: Colors.red, width: 3)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DestroyingObjects(
                              top: 0.0,
                              left: 0.0,
                              valueVisibility: lvlWhichNotVisibleTreshLeft,
                            ),
                            //Tree(),
                            DestroyingObjects(
                              top: 0.0,
                              left: 0.0,
                              valueVisibility: lvlWhichNotVisibleTreshRight,
                            ),
                          ],
                        ),
                      ),
                    ),
                    //),
                    Expanded(
                      // child: Container(
                      //   decoration: BoxDecoration(
                      //       border: Border.all(color: Colors.green, width: 3)),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: River(
                          top: 0.0,
                          left: 0.0,
                        ),
                      ),
                    ),
                    //),
                  ],
                ),
                Tree(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
