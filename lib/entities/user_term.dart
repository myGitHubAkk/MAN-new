import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:man_project/const/colors.dart';
import 'package:man_project/data/terms.dart';

class UserTerm {
  static int namberWord = 0;
  static int namberTerm = 0;
  static Term term = TermData.terms[namberTerm];
  // String termTitle = term.title;
  static String valueUserTerm = '';

  set addValue(String value) {
    valueUserTerm += value;
  }

  Widget get widget => _termWidget();

  Widget _termWidget() {
    String termTitle = TermData.terms[namberTerm].title;
    return Text(
      '$termTitle - це $valueUserTerm',
      style: TextStyle(
          fontSize: 18, color: blackGrey, fontWeight: FontWeight.w400),
    );
  }
}
