import 'package:flutter/material.dart';
import 'package:man_project/const/value_widget_visibility.dart';
import 'package:man_project/presentation/home_screen/back_widget/template/changing_objects_%20in_back.dart';

class Cloud extends StatelessWidget {
  final top;
  final left;

  Cloud({
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
      width: 100.0,
      height: 100.0,
      inputData: {
        'ValuesVisibility': cloudPurityLvl,
        'WidgetName': ['Тучка', 'Group 15', 'тучка чиста'],
      },
    );
  }
}
