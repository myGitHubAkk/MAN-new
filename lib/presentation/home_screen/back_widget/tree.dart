import 'package:flutter/material.dart';
import 'package:man_project/presentation/home_screen/back_widget/template/back_widget_template.dart';
import 'package:man_project/presentation/home_screen/back_widget/tree_face.dart';

class Tree extends StatelessWidget {
  double _difference = 220.0 / 170.0;
  double _width = 170;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 0.0),
      // decoration:
      //     BoxDecoration(border: Border.all(color: Colors.red, width: 5)),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            // decoration: BoxDecoration(
            //     border: Border.all(color: Colors.green, width: 5)),
            child: BackWidgetTemplate(
              poosition: {'top': 85.0, 'left': 0.0},
              width: _width,
              height: _width * _difference,
              name: 'Грут тіло',
            ),
          ),
          Container(
            // decoration:
            //     BoxDecoration(border: Border.all(color: Colors.red, width: 5)),
            child: TreeFace(),
          ),

          // Container(
          //   decoration: BoxDecoration(
          //       border: Border.all(
          //           color: Colors.red, width: 5)),
          //   child: backgroundImage(
          //     name: 'Грут тіло',
          //     width: 140.0,
          //     height: 180.0,
          //   ),
          // )
        ],
      ),
    );
  }
}
