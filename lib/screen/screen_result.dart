import 'package:flutter/material.dart';
import 'package:quizz_app/model/model_quizz.dart';

class ResultScreen extends StatelessWidget {
  final List<int> answers;
  final List<Quizz> quizzs;

  const ResultScreen({Key key, this.answers, this.quizzs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    int score = 0;

    for (int i = 0; i < quizzs.length; i++) {
      if (quizzs[i].answer == answers[i]) {
        //i번째 퀴즈 답과 사용자의 답이 같다면
        score += 1;
      }
    }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("My Quizz Result"),
          backgroundColor: Colors.indigo,
          leading: Container(),
        ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.indigo),
              color: Colors.indigo,
            ),
            width: width * 0.85,
            height: height * 0.5,
            child: Column(
              children: [],
            ),
          ),
        ),
      ),
    );
  }
}
