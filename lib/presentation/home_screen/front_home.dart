import 'package:flutter/material.dart';
import 'package:man_project/presentation/game_screen/original_game_sreen.dart';
import 'package:man_project/presentation/widget_template.dart';

class FrontHomeScreen extends StatefulWidget {
  const FrontHomeScreen({Key? key}) : super(key: key);

  @override
  _FrontHomeScreenState createState() => _FrontHomeScreenState();
}

class _FrontHomeScreenState extends State<FrontHomeScreen> {
  double widthBar = 200;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
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
                  '${1} Lvl',
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
                      width: widthBar * 1,
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
          ),
        ],
      ),
    );
  }
}