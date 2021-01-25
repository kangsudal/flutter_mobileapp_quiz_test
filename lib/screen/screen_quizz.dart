import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:quizz_app/model/model_quizz.dart';

/* 퀴즈 문제 푸는 화면 */
class QuizzScreen extends StatefulWidget {
  List<Quizz> quizzs;
  QuizzScreen({this.quizzs}); //생성자: 이전 화면으로부터 데이터를 받아옴
  @override
  _QuizzScreenState createState() => _QuizzScreenState();
}

class _QuizzScreenState extends State<QuizzScreen> {
  List<int> _answers = [-1, -1, -1]; //문제 정답을 담을 칸
  List<bool> _answerState = [false, false, false, false]; //문제의 답을 선택했는지 상태값
  int _currentIndex = 0; //현재 보고있는 문제 번호

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
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(20),
            //   border: Border.all(color: Colors.deepPurple),
            // ),
            width: width * 0.85,
            height: height * 0.5,
            child: Swiper(
              physics: NeverScrollableScrollPhysics(),
              loop: false,
              itemCount: widget.quizzs.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildQuizzCard(widget.quizzs[index], width, height);
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuizzCard(Quizz quizz, double width, double height) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(0, width * 0.024, 0, width * 0.024),
            child: Text(
              'Q' + (_currentIndex + 1).toString() + '.',
              style: TextStyle(
                  fontSize: width * 0.06, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: width * 0.8,
            padding: EdgeInsets.only(top: width*0.012),
            child: Text(quizz.title),
          )
        ],
      ),
    );
  }
}
