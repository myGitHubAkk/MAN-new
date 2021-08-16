import 'package:man_project/data/terms.dart';

class CheckingAnswer {
  int _namberWord = 0;

  late String _answer;
  late bool _isTrueAnswer;
  late bool _isTrueAnswerUserVersion;
  late bool _isTrueUserVersion;

  set aswer(value) {
    _answer = value['answer'];
    _isTrueAnswerUserVersion = value['isTrue'];
  }

  bool get isTrueAnswer {
    checking();
    return _isTrueUserVersion;
  }

  void checking() {
    if (TermData.terms[TermData.namberTerm].values[_namberWord] == _answer) {
      _isTrueAnswer = true;
    } else {
      _isTrueAnswer = false;
    }

    if (_isTrueAnswer && _isTrueAnswerUserVersion) {
      _isTrueUserVersion = true;
      _namberWord++;
    } else if (_isTrueAnswer && !_isTrueAnswerUserVersion) {
      _isTrueUserVersion = true;
    } else if (!_isTrueAnswer && _isTrueAnswerUserVersion) {
      _isTrueUserVersion = false;
    } else if (!_isTrueAnswer && !_isTrueAnswerUserVersion) {
      _isTrueUserVersion = true;
    }
  }
}
