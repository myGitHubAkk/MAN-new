import 'package:man_project/data/terms.dart';
import 'package:man_project/data/xp.dart';
import 'package:man_project/domain/controller.dart';
import 'package:man_project/domain/xp_bloc.dart';
import 'package:man_project/entities/game_state.dart';
import 'package:man_project/entities/subjects/subject_width_answer.dart';
import 'package:man_project/entities/user_term.dart';
import 'package:man_project/presentation/home_screen/front_home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class CheckingAnswer {
  static String _answer = '';
  static bool _isTrueAnswer = false;
  static bool _isTrueAnswerUserVersion = false;
  static bool isTrueUserVersion = false;

  set addUserVersion(bool userVersion) {
    _answer = SubjectWidthAnswer().answer;
    _isTrueAnswerUserVersion = userVersion;
    checkingUserVersion();
  }

  void checkingUserVersion() {
    List trueTerm = TermData.terms[UserTerm.namberTerm].values;
    String trueAnswer =
        TermData.terms[UserTerm.namberTerm].values[UserTerm.namberWord];
    Controller controller = Get.put(Controller());

    if (trueAnswer == _answer) {
      _isTrueAnswer = true;
    } else {
      _isTrueAnswer = false;
    }

    if (_isTrueAnswer && _isTrueAnswerUserVersion) {
      isTrueUserVersion = true;

      if (UserTerm.namberWord == trueTerm.length - 1) {
        GameState.isWinner = true;
        UserTerm.namberTerm++;
        controller.changeNamberTerm(UserTerm.namberTerm);
        Xp().addXp(0.5);
        controller.changeXp(Xp.xp);
        UserTerm.namberWord = 0;
        //_saveNamberTerm();
        // print('');
        // print('--------------------------------------');
        // print(
        //     'конець раунда namberWord: ${UserTerm.namberWord} Xp: ${Xp.xpFull} namberTerm: ${UserTerm.namberTerm}');
        // print('');
      } else {
        UserTerm.namberWord++;
        // print('');
        // print('--------------------------------------');
        // print(
        //     'не конець namberWord: ${UserTerm.namberWord} із ${TermData.terms.length}');
        // print('');
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
}

// _saveNamberTerm() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   await prefs.setInt('namberTerm', UserTerm.namberTerm);
//   UserTerm.namberTerm = prefs.getInt('namberTerm') ?? 0;
// }
