import 'package:flutter/material.dart';
import 'package:man_project/const/value_widget_visibility.dart';
import 'package:man_project/data/xp.dart';
import 'package:man_project/domain/back_name_widget_create.dart';
import 'package:man_project/presentation/widget_template.dart';

class ChangingObjectsInBack extends StatefulWidget {
  final Map inputData;

  ChangingObjectsInBack({required this.inputData});

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
    return backgroundImage(name: name, width: 100, height: 100);
  }
}
