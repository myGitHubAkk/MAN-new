import 'package:flutter/material.dart';
import 'package:man_project/const/value_widget_visibility.dart';
import 'package:man_project/data/xp.dart';
import 'package:man_project/presentation/home_screen/back_widget/cloud.dart';
import 'package:man_project/presentation/home_screen/back_widget/destroying_objects.dart';
import 'package:man_project/presentation/home_screen/back_widget/river.dart';
import 'package:man_project/presentation/home_screen/back_widget/template/back_widget_template.dart';
import 'package:man_project/presentation/home_screen/back_widget/tree_face.dart';
import 'package:man_project/presentation/widget_template.dart';

import 'back_widget/template/changing_objects_ in_back.dart';

class BackHomeScreen extends StatefulWidget {
  const BackHomeScreen({Key? key}) : super(key: key);

  @override
  _BackHomeScreenState createState() => _BackHomeScreenState();
}

class _BackHomeScreenState extends State<BackHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            child: backgroundImage(
              name: 'Земля нова',
              width: double.infinity,
              height: 335,
            ),
          ),
          Container(
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  // child: Container(
                  //   decoration: BoxDecoration(
                  //       border: Border.all(color: Colors.blue, width: 3)),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: Container(
                          width: 20,
                          height: 20,
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Cloud(
                            top: 110.0,
                            left: 10.0,
                          ),
                          Cloud(
                            top: 40.0,
                            left: 15.0,
                          ),
                          Cloud(
                            top: 90.0,
                            left: 20.0,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                //),
                Expanded(
                  flex: 5,
                  // child: Container(
                  //   decoration: BoxDecoration(
                  //       border: Border.all(color: Colors.red, width: 3)),
                  child: Stack(
                    children: [
                      DestroyingObjects(
                        top: 130.0,
                        left: 120.0,
                        valueVisibility: lvlWhichNotVisibleFactory,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          DestroyingObjects(
                            top: 170.0,
                            left: 0.0,
                            valueVisibility: lvlWhichNotVisibleTreshLeft,
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 0.0),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.red, width: 5)),
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.green, width: 5)),
                                  child: BackWidgetTemplate(
                                    poosition: {'top': 75.0, 'left': 0.0},
                                    width: 170.0,
                                    height: 220.0,
                                    name: 'Грут тіло',
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.red, width: 5)),
                                  child: TreeFace(),
                                ),

                                // Container(
                                //   decoration: BoxDecoration(
                                //       border: Border.all(
                                //           color: Colors.red, width: 5)),
                                //   child: backgroundImage(
                                //     name: 'Грут тіло',
                                //     width: 140.0,
                                //     height: 180.0,
                                //   ),
                                // )
                              ],
                            ),
                          ),
                          DestroyingObjects(
                            top: 180.0,
                            left: 0.0,
                            valueVisibility: lvlWhichNotVisibleTreshRight,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                //),
                Expanded(
                  flex: 3,
                  // child: Container(
                  //   decoration: BoxDecoration(
                  //       border: Border.all(color: Colors.green, width: 3)),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 40.0),
                    child: River(
                      top: 0.0,
                      left: 0.0,
                    ),
                  ),
                ),
                //),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
