import 'package:flutter/cupertino.dart';
import 'package:man_project/data/terms.dart';

class UserTerm {
  static int namberWord = 0;
  static Term term = TermData.terms[TermData.namberTerm];
  String termTitle = term.title;
  static String valueUserTerm = '';

  set addValue(String value) {
    valueUserTerm += value;
    print(valueUserTerm);
  }

  Widget get widget => _termWidget();

  Widget _termWidget() {
    print('вертаєм');
    return Text('$termTitle - це $valueUserTerm');
  }
}
