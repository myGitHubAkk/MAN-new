import 'package:man_project/data/terms.dart';
import 'package:man_project/entities/subjects/apple.dart';
import 'package:man_project/entities/user_term.dart';

class CheckingAnswer {
  static String _answer = '';
  static bool _isTrueAnswer = false;
  static bool _isTrueAnswerUserVersion = false;
  static bool isTrueUserVersion = false;

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
    String trueAnswer =
        TermData.terms[TermData.namberTerm].values[UserTerm.namberWord];
    // print('true $trueAnswer');
    if (trueAnswer == _answer) {
      _isTrueAnswer = true;
    } else {
      _isTrueAnswer = false;
    }

    if (_isTrueAnswer && _isTrueAnswerUserVersion) {
      isTrueUserVersion = true;
      UserTerm.namberWord++;
      UserTerm().addValue = _answer;
    } else if (_isTrueAnswer && !_isTrueAnswerUserVersion) {
      isTrueUserVersion = false;
    } else if (!_isTrueAnswer && _isTrueAnswerUserVersion) {
      isTrueUserVersion = false;
    } else if (!_isTrueAnswer && !_isTrueAnswerUserVersion) {
      isTrueUserVersion = true;
    }
  }

  // void _addUserVersion(Map value) {
  //   _answer = AppleWithWords().answer;
  //   _isTrueAnswerUserVersion = value['isTrue'];
  //   checkingUserVersion();
  // }
}
