import 'package:flutter/material.dart';
import 'package:man_project/const/value_widget_visibility.dart';
import 'package:man_project/presentation/home_screen/back_widget/changing_objects_%20in_back.dart';

class Cloud extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangingObjectsInBack(
      inputData: {
        'ValuesVisibility': cloudPurityLvl,
        'WidgetName': ['Тучка', 'Group 15', 'тучка чиста'],
      },
    );
  }
}
