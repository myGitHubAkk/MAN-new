import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:man_project/const/colors.dart';
import 'package:man_project/data/terms.dart';
import 'package:man_project/domain/controller.dart';
import 'package:get/get.dart';

class UserTerm {
  static Controller controller = Get.put(Controller());

  static int namberWord = 0;
  static int namberTerm = controller.namberTerm;
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
