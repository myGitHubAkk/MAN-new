import 'package:flutter/material.dart';
import 'package:man_project/const/value_widget_visibility.dart';
import 'package:man_project/presentation/home_screen/back_widget/changing_objects_%20in_back.dart';

class River extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangingObjectsInBack(
      width: double.infinity,
      height: 90,
      inputData: {
        'ValuesVisibility': riverPurityLvl,
        'WidgetName': [
          'Бек Річка грязна',
          'Бек Річка нейтральна',
          'Бек Річка чиста'
        ],
      },
    );
  }
}
