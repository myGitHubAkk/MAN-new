import 'package:flutter/material.dart';
import 'package:man_project/const/value_widget_visibility.dart';
import 'package:man_project/data/xp.dart';
import 'package:man_project/domain/back_name_widget_create.dart';
import 'package:man_project/presentation/widget_template.dart';

class Cloud extends StatefulWidget {
  @override
  _CloudState createState() => _CloudState();
}

class _CloudState extends State<Cloud> {
  String name = '';

  @override
  void initState() {
    super.initState();
    BackNameWidgetCreate backNameWidgetCreate = BackNameWidgetCreate();
    backNameWidgetCreate.create = {
      'ValuesVisibility': cloudPurityLvl,
      'WidgetName': ['Тучка', 'Group 15', 'тучка чиста'],
    };
    name = backNameWidgetCreate.name;
  }

  @override
  Widget build(BuildContext context) {
    // if (Xp.xpFractional > riverPurityLvl['Dirty']! &&
    //     Xp.xpFractional < riverPurityLvl['Medium']!) {
    //   nameCloud = 'Тучка';
    // }

    // if (Xp.xpFractional > riverPurityLvl['Medium']! &&
    //     Xp.xpFractional < riverPurityLvl['Clean']!) {
    //   nameCloud = 'Group 15';
    // }

    // if (Xp.xpFractional > riverPurityLvl['Clean']!) {
    //   nameCloud = 'тучка чиста';
    // }

    return backgroundImage(name: name, width: 100, height: 100);
  }
}
