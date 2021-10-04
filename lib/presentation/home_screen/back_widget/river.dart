import 'package:flutter/material.dart';
import 'package:man_project/const/value_widget_visibility.dart';
import 'package:man_project/presentation/home_screen/back_widget/template/changing_objects_%20in_back.dart';

class River extends StatelessWidget {
  final top;
  final left;

  River({
    required this.top,
    required this.left,
  });

  @override
  Widget build(BuildContext context) {
    Map position = {
      'top': top,
      'left': left,
    };

    return ChangingObjectsInBack(
      position: position,
      width: double.infinity,
      height: 80.0,
      inputData: {
        'ValuesVisibility': riverPurityLvl,
        'WidgetName': ['річка брудеа', 'річка сер', 'річка чиста'],
      },
    );
  }
}
