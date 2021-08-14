import 'package:flutter/cupertino.dart';
import 'package:man_project/data/terms.dart';

class UserTerm {
  static Term _term = TermData.terms[TermData.namberTerm];
  String termTitle = _term.title;
  static String valueUserTerm = '';

  set addValue(String value) => valueUserTerm += value;

  Widget get widget => _termWidget();

  Widget _termWidget() {
    return Text('$termTitle - це $valueUserTerm');
  }
}
