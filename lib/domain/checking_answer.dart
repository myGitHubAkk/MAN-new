import 'package:man_project/data/terms.dart';
import 'package:man_project/data/xp.dart';
import 'package:man_project/domain/xp_bloc.dart';
import 'package:man_project/entities/game_state.dart';
import 'package:man_project/entities/subjects/apple.dart';
import 'package:man_project/entities/user_term.dart';
import 'package:man_project/presentation/home_screen/front_home.dart';

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
    List trueTerm = TermData.terms[UserTerm.namberTerm].values;
    String trueAnswer =
        TermData.terms[UserTerm.namberTerm].values[UserTerm.namberWord];
    //XpBloc xpBloc = XpBloc();
    FrontHomeScreen screen = FrontHomeScreen();

    if (trueAnswer == _answer) {
      _isTrueAnswer = true;
    } else {
      _isTrueAnswer = false;
    }

    if (_isTrueAnswer && _isTrueAnswerUserVersion) {
      isTrueUserVersion = true;

      if (UserTerm.namberWord == trueTerm.length - 1) {
        GameState.isWinner = true;
        //xpBloc.inputEventSink.add(0.5);
        UserTerm.namberTerm++;
        Xp().addXp(0.5);
        //FrontHomeScreenState().update();
      } else {
        UserTerm.namberWord++;
      }

      UserTerm().addValue = _answer;
      //userTerm.add(_answer);
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
