import 'package:flutter/material.dart';
import 'package:man_project/const/value_widget_visibility.dart';
import 'package:man_project/presentation/home_screen/back_widget/template/changing_objects_%20in_back.dart';

class TreeFace extends StatelessWidget {
  double difference = 180 / 130;
  double width = 65;
  @override
  Widget build(BuildContext context) {
    return ChangingObjectsInBack(
      position: {'top': 0.0, 'left': 0.0},
      width: width,
      height: width * difference,
      inputData: {
        'ValuesVisibility': treeHappinessLvl,
        'WidgetName': [
          'сама грусна фіо міна',
          'грусна фіо міна',
          'нейтральна фіо міна',
          'весела фіо  міна',
          'щаслива  фіо міна',
          'дуже щаслива фіо міна',
        ],
      },
    );
  }
}
