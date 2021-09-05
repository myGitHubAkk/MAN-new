import 'package:flutter/material.dart';
import 'package:man_project/presentation/widget_template.dart';

class BackWidgetTemplate extends StatelessWidget {
  final width;
  final height;
  final poosition;
  final name;

  BackWidgetTemplate(
      {@required this.poosition,
      @required this.width,
      @required this.height,
      @required this.name});

  @override
  Widget build(BuildContext context) {
    // double heightScreen = MediaQuery.of(context).size.height;
    // double widthScreen = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.fromLTRB(poosition['left'], poosition['top'], 0, 0),
      child: backgroundImage(
        name: name,
        width: width,
        height: height,
      ),
    );
  }
}
