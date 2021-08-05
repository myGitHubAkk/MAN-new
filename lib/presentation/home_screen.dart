import 'package:flutter/material.dart';
import 'package:man_project/presentation/game_screen/original_game_sreen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return OriginalGameScreen();
  }
}
