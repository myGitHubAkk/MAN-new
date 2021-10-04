import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:man_project/const/value_widget_visibility.dart';
import 'package:man_project/data/xp.dart';
import 'package:man_project/presentation/game_screen/game_sreen.dart';
import 'package:man_project/presentation/home_screen/back_home.dart';
import 'package:man_project/presentation/home_screen/front_home.dart';
import 'package:man_project/domain/snake_move.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackHomeScreen(),
          Opacity(
            opacity: 0.23,
            child: Container(
              color: Colors.white,
            ),
          ),
          FrontHomeScreen()
        ],
      ),
    );
  }
}
