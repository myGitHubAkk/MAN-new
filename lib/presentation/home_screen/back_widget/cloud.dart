import 'package:flutter/material.dart';
import 'package:man_project/data/xp.dart';
import 'package:man_project/presentation/widget_template.dart';

class Cloud extends StatelessWidget {
  String nameCloud = '';

  @override
  Widget build(BuildContext context) {
    if (Xp.xpFractional > riverPurityLvl['Dirty']! &&
        Xp.xpFractional < riverPurityLvl['Medium']!) {
      nameCloud = 'Тучка';
    }

    if (Xp.xpFractional > riverPurityLvl['Medium']! &&
        Xp.xpFractional < riverPurityLvl['Clean']!) {
      nameCloud = 'Group 15';
    }

    if (Xp.xpFractional > riverPurityLvl['Clean']!) {
      nameCloud = 'тучка чиста';
    }

    return CloudTemplate(nameCloud);
  }
}

Widget CloudTemplate(String name) {
  return backgroundImage(name: name, width: 100, height: 100);
}
