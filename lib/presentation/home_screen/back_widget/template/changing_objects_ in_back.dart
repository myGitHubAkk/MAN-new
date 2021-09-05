import 'package:flutter/material.dart';
import 'package:man_project/const/value_widget_visibility.dart';
import 'package:man_project/data/xp.dart';
import 'package:man_project/domain/back_name_widget_create.dart';
import 'package:man_project/presentation/home_screen/back_widget/template/back_widget_template.dart';
import 'package:man_project/presentation/widget_template.dart';
import 'package:man_project/presentation/home_screen/back_widget/destroying_objects.dart';

class ChangingObjectsInBack extends StatefulWidget {
  final inputData;
  final width;
  final height;
  final position;

  ChangingObjectsInBack(
      {required this.inputData,
      required this.width,
      required this.height,
      required this.position});

  @override
  _ChangingObjectsInBackState createState() => _ChangingObjectsInBackState();
}

class _ChangingObjectsInBackState extends State<ChangingObjectsInBack> {
  String name = '';

  void _fillInName() {
    BackNameWidgetCreate backNameWidgetCreate = BackNameWidgetCreate();
    backNameWidgetCreate.create = widget.inputData;
    name = backNameWidgetCreate.name;
  }

  @override
  Widget build(BuildContext context) {
    _fillInName();
    return BackWidgetTemplate(
      width: widget.width,
      height: widget.height,
      name: name,
      poosition: widget.position,
    );
  }
}
