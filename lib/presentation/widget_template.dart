import 'package:flutter/material.dart';

Widget backgroundImage(
    {required String name, required double width, required double height}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/img/$name.png'))),
  );
}

Widget marginWidget(
    {required double top, required double left, required Widget widget}) {
  return Container(
    margin: EdgeInsets.fromLTRB(left, top, 0, 0),
    child: widget,
  );
}
