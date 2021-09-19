import 'package:flutter/material.dart';
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
                  child: RichText(
                    text: TextSpan(
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        children: [
                          TextSpan(
                            text: 'Це ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'сад ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'в якому ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'живе ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'Дерево. ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'Воно ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'адже природа ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'навколо ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'нього ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'погана. ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'Єдиний ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'хто ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'може ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'все ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'виправить ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: '-  ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'це ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'Моржик Прибиральник. ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'Він ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'відповідальний ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'за ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'чистоту ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'цього ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'саду.',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'Але ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'Моржик ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'не знає ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'як ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'повинно ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'виглядати ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'чисте ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'довкілля. ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'Щоб ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'розвеселити ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'дерево ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'потрібно ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'щоб ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'моржик ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'прочитав ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'інструкцію. ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'Але ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'вона',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'розкидана ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'і щоб ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'її ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'зібрати ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'потрібна ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'твоя ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'допомога.',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'Потрібно ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'перетворити ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'моржика ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'і ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'допомогти ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'йому ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'зібрати ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'інструкцію.',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'Щоб ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'це ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'зробити ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'натискай ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'на ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'кнопку. ',
                            style: TextStyle(),
                          ),
                        ]),
                  ),
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
                  isShowDialog != isShowDialog;
                }),
          ),
        ],
      ),
    );
  }
}
