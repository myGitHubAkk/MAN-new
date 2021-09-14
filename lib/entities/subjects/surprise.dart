// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:man_project/data/terms.dart';
// import 'package:man_project/domain/create_position.dart';
// import 'package:man_project/entities/subjects/subject.dart';
// import 'package:man_project/entities/user_term.dart';
// import 'package:audioplayers/audioplayers.dart';

// class Surprise extends Subject {
//   CreatePosition _createPosition = CreatePosition();
//   AudioCache audioPlayer = AudioCache();

//   @override
//   int get position => _createPosition.posiiton;

//   @override
//   void snakeClash() {
//     //print(AudioPlayer.players);
//     audioPlayer.play('assets/audio/slipknot_-_unsainted.mp3');
//   }

//   @override
//   void gameOver() {
//     _createPosition = CreatePosition();
//   }

//   static void randomNextAnswer() {}

//   @override
//   Widget get widget {
//     return cellTemlate(colorLight: Colors.yellow, colorDark: Colors.green);
//   }
// }
