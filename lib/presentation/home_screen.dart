import 'package:flutter/material.dart';
import 'package:man_project/presentation/game_screen/original_game_sreen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String textInfo = 'тут живе грут';
  double widthBar = 200;

  @override
  Widget build(BuildContext context) {
    // TreeBloc _bloc = TreeBloc();
    // TermData termData = TermData();
    // return StreamBuilder(
    //   stream: _bloc.outputStateStream,
    //   initialData: xpA,
    //   builder: (context, snapshot) {
    //     var xp = snapshot.data as Map<String, num>;
    //     int fractionalXP = xp['fractional']! as int;
    //     double wholeXP = xp['whole']! as double;
    //     print(xp);
    return Scaffold(
      body: Stack(
        children: [
          // HomeBack(fractionalXP),
          //HomeBack(1),
          Opacity(
            opacity: 0.2,
            child: Container(
              color: Colors.white,
            ),
          ),
          Center(
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
                              name: 'Рішотка шкали',
                              width: widthBar,
                              height: 25),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          //isVisibilityInfo ? Info(textInfo) : Container(),
        ],
      ),
    );
    //   },
    // );
  }
}

Widget backgroundImage(
    {required String name, required double width, required double height}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/img/$name.png'))),
  );
}
