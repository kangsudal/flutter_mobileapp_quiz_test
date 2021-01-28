import 'package:flutter/material.dart';
import 'package:quizz_app/model/model_quizz.dart';
import 'package:quizz_app/screen/screen_home.dart';

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
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
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
              height: height * 0.7,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: width * 0.048),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.indigo),
                      color: Colors.white,
                    ),
                    width: width * 0.73,
                    height: height * 0.3,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(
                              0, width * 0.048, 0, width * 0.01),
                          child: Text(
                            '수고하셨습니다!',
                            style: TextStyle(
                              fontSize: width * 0.055,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          '당신의 점수는',
                          style: TextStyle(
                            fontSize: width * 0.048,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        Text(
                          score.toString() + '/' + quizzs.length.toString(),
                          style: TextStyle(
                            fontSize: width * 0.21,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(width * 0.012)),
                      ],
                    ),
                  ),
                  Expanded(child: Container()),
                  Container(
                    padding: EdgeInsets.only(bottom: width * 0.048),
                    child: ButtonTheme(
                      minWidth: width * 0.73,
                      height: height * 0.05,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                        },
                        child: Text('홈으로 돌아가기'),
                        color: Colors.white,
                        textColor: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
