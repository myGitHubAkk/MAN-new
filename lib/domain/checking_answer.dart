import 'package:man_project/data/terms.dart';
import 'package:man_project/entities/subjects.dart';
import 'package:man_project/entities/user_term.dart';

class CheckingAnswer {
  static int _namberWord = 0;

  static String _answer = '';
  static bool _isTrueAnswer = false;
  static bool _isTrueAnswerUserVersion = false;
  static bool _isTrueUserVersion = false;

  set addUserVersion(bool userVersion) {
    // _addUserVersion(value);
    _answer = AppleWithWords().answer;
    _isTrueAnswerUserVersion = userVersion;
    checkingUserVersion();
  }

  // bool get isTrueAnswer {
  //   _checkingAnswer();
  //   return _isTrueAnswer;
  // }

  // bool get isTrueUserVersion {
  //   checkingUserVersion();
  //   return _isTrueUserVersion;
  // }

  // void _checkingAnswer() {
  //   String trueAnswer = TermData.terms[TermData.namberTerm].values[_namberWord];
  //   // print('true $trueAnswer');
  //   if (trueAnswer == _answer) {
  //     _isTrueAnswer = true;
  //   } else {
  //     _isTrueAnswer = false;
  //   }
  // }

  void checkingUserVersion() {
    String trueAnswer = TermData.terms[TermData.namberTerm].values[_namberWord];
    // print('true $trueAnswer');
    if (trueAnswer == _answer) {
      _isTrueAnswer = true;
    } else {
      _isTrueAnswer = false;
    }

    if (_isTrueAnswer && _isTrueAnswerUserVersion) {
      _isTrueUserVersion = true;
      _namberWord++;
      UserTerm().addValue = _answer;
    } else if (_isTrueAnswer && !_isTrueAnswerUserVersion) {
      _isTrueUserVersion = false;
    } else if (!_isTrueAnswer && _isTrueAnswerUserVersion) {
      _isTrueUserVersion = false;
    } else if (!_isTrueAnswer && !_isTrueAnswerUserVersion) {
      _isTrueUserVersion = true;
    }
  }

  // void _addUserVersion(Map value) {
  //   _answer = AppleWithWords().answer;
  //   _isTrueAnswerUserVersion = value['isTrue'];
  //   checkingUserVersion();
  // }
}
