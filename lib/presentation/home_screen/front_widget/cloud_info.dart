import 'package:flutter/material.dart';
import 'package:man_project/const/colors.dart';
import 'package:man_project/entities/game_state.dart';
import 'package:man_project/presentation/home_screen/front_home.dart';

class Cloudinfo extends StatelessWidget {
  final width;
  final height;

  Cloudinfo({required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            width: width * 0.9,
            height: height * 0.8,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/img/хмарка інформації.png'),
              ),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: height * 0.09,
                    horizontal: width * 0.12,
                  ),
                  child: TextInfo(),
                ),
                Positioned(
                  bottom: height * 0.06,
                  child: Container(
                    width: width * 0.9,
                    height: 110,
                    child: Image.asset('assets/img/спить.png'),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: height * 0.05,
            right: width * 0.05,
            child: IconButton(
                iconSize: 25,
                icon: Icon(
                  Icons.cancel,
                  color: Colors.grey,
                ),
                onPressed: () {
                  if (GameState.isShowDialog) {
                    GameState.isShowDialog = false;
                  } else if (!GameState.isShowDialog) {
                    GameState.isShowDialog = true;
                  }
                }),
          ),
        ],
      ),
    );
  }
}

class TextInfo extends StatelessWidget {
  const TextInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
          children: [
            TextSpan(
              text: 'Це ',
              style: TextStyle(fontSize: 16),
            ),
            TextSpan(
              text: 'сад ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: blackGreen,
              ),
            ),
            TextSpan(
              text: 'в якому ',
              style: TextStyle(fontSize: 14),
            ),
            TextSpan(
              text: 'живе ',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            TextSpan(
              text: 'Дерево. ',
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: purple),
            ),
            TextSpan(
              text: 'Воно ',
              style: TextStyle(fontSize: 16),
            ),
            TextSpan(
              text: 'сумне ',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'адже природа ',
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'навколо ',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'нього ',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'погана. ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'Єдиний ',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'хто ',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'може ',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'все ',
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'виправить ',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: '-  ',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'це ',
              style: TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'Моржик Прибиральник. ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: blackGreen,
              ),
            ),
            TextSpan(
              text: 'Він ',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'відповідальний ',
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'за ',
              style: TextStyle(
                fontSize: 12,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'чистоту ',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'цього ',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'саду. ',
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'Але ',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'Моржик ',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: blackGreen,
              ),
            ),
            TextSpan(
              text: 'не знає ',
              style: TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'як ',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'повинно ',
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'виглядати ',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'чисте ',
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'довкілля. ',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'Щоб ',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'розвеселити ',
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'Дерево ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: purple,
              ),
            ),
            TextSpan(
              text: 'потрібно ',
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'щоб ',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'Моржик ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: blackGreen,
              ),
            ),
            TextSpan(
              text: 'прочитав ',
              style: TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'інструкцію. ',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'Але ',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'вона',
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'розкидана ',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'і щоб ',
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'її ',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'зібрати ',
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'потрібна ',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'твоя ',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'допомога. ',
              style: TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'Потрібно ',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'перетворити ',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'Mоржика ',
              style: TextStyle(
                fontSize: 18,
                color: blackGreen,
              ),
            ),
            TextSpan(
              text: 'і ',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'допомогти ',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'йому ',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'зібрати ',
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'інструкцію. ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'Щоб ',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'це ',
              style: TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'зробити ',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'натискай ',
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'на ',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'кнопку. ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ]),
    );
  }
}
