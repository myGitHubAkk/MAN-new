import 'package:flutter/material.dart';
import 'package:man_project/presentation/game_screen/original_game_sreen.dart';
import 'package:man_project/presentation/home_screen/back_home.dart';
import 'package:man_project/presentation/home_screen/front_home.dart';
import 'package:man_project/domain/snake_move.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String textInfo = 'тут живе грут';

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
          BackHomeScreen(),
          Opacity(
            opacity: 0.2,
            child: Container(
              color: Colors.white,
            ),
          ),
          FrontHomeScreen()

          //isVisibilityInfo ? Info(textInfo) : Container(),
        ],
      ),
    );
    //   },
    // );
  }
}
