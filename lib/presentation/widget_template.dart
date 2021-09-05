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
