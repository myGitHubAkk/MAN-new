import 'package:man_project/data/terms.dart';

class CheckingAnswer {
  static int _namberWord = 0;

  static String _answer = '';
  static bool _isTrueAnswer = false;
  static bool _isTrueAnswerUserVersion = false;
  static bool _isTrueUserVersion = false;

  set answer(Map value) {
    _addUserVersion(value);
  }

  bool get isTrueAnswer {
    _checkingAnswer();
    return _isTrueAnswer;
  }

  bool get isTrueUserVersion {
    checkingUserVersion();
    return _isTrueUserVersion;
  }

  void _checkingAnswer() {
    String trueAnswer = TermData.terms[TermData.namberTerm].values[_namberWord];
    // print('true $trueAnswer');
    if (trueAnswer == _answer) {
      _isTrueAnswer = true;
    } else {
      _isTrueAnswer = false;
    }
  }

  void checkingUserVersion() {
    if (_isTrueAnswer && _isTrueAnswerUserVersion) {
      _isTrueUserVersion = true;
      _namberWord++;
      // print('угадав $_isTrueUserVersion');
    } else if (_isTrueAnswer && !_isTrueAnswerUserVersion) {
      _isTrueUserVersion = false;
    } else if (!_isTrueAnswer && _isTrueAnswerUserVersion) {
      _isTrueUserVersion = false;
    } else if (!_isTrueAnswer && !_isTrueAnswerUserVersion) {
      _isTrueUserVersion = true;
    }
  }

  void _addUserVersion(Map value) {
    _answer = value['answer'];
    _isTrueAnswerUserVersion = value['isTrue'];
  }
}
