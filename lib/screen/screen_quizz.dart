import 'package:flutter/material.dart';
import 'package:quizz_app/model/model_quizz.dart';

/* 퀴즈 문제 푸는 화면 */
class QuizzScreen extends StatefulWidget {
  List<Quizz> quizzs;
  QuizzScreen({this.quizzs}); //생성자: 이전 화면으로부터 데이터를 받아옴
  @override
  _QuizzScreenState createState() => _QuizzScreenState();
}

class _QuizzScreenState extends State<QuizzScreen> {
  List<int> _answers = [-1, -1, -1];
  List<bool> _answerState = [false, false, false, false];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.indigo,
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.deepPurple),
            ),
            width: width* 0.85,
            height: height * 0.5,
          ),
        ),
      ),
    );
  }
}
