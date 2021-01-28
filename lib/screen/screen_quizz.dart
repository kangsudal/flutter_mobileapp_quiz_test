import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:quizz_app/model/model_quizz.dart';
import 'package:quizz_app/widget/widget_candidate.dart';

/* 퀴즈 문제 푸는 화면 */
class QuizzScreen extends StatefulWidget {
  List<Quizz> quizzs;
  QuizzScreen({this.quizzs}); //생성자: 이전 화면으로부터 데이터를 받아옴
  @override
  _QuizzScreenState createState() => _QuizzScreenState();
}

class _QuizzScreenState extends State<QuizzScreen> {
  List<int> _answers = [-1, -1, -1]; //문제별 사용자의 정답을 담을 칸 3문제
  List<bool> _answerState = [false, false, false, false]; //문제의 답을 선택했는지 상태값 (1문제당 4개선택지)
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
              physics: NeverScrollableScrollPhysics(),//퀴즈 스킵 막음
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
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(0, width * 0.024, 0, width * 0.024),
            child: Text(
              'Quizz' + (_currentIndex + 1).toString() + '.',
              style: TextStyle(
                  fontSize: width * 0.06, fontWeight: FontWeight.bold),
            ),
          ),//퀴즈 번호
          Container(
            width: width * 0.8,
            padding: EdgeInsets.only(top: width * 0.012),
            child: AutoSizeText(
              quizz.title,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(
                fontSize: width * 0.048,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),//퀴즈 제목
          Expanded(
            child: Container(),
          ),
          Column(
            //퀴즈 선택지
            children: _buildCandidates(width, quizz),
          )
        ],
      ),
    );
  }

  _buildCandidates(double width, Quizz quizz) {
    List<Widget> _children = []; //선택지 위젯들을 담을 리스트
    for (int i = 0; i < 4; i++) { 
      _children.add(
        CandWidget(
          index: i,
          text: quizz.candidates[i],
          width: width,
          answerState: _answerState[i], //4개의 선택지중 i번째 선택지가 눌렸는지 true, false
          tap: () {
//            print('tapped!');
            setState(() {//선택지가 눌렸을때
              for (int j = 0; j < 4; j++) {// 반복문을 통해 전체 선택지를 확인하며 지금의 선택지의 answerState를 true로 변경해주며 answers에 기록
                if (j == i) {//눌린 선택지 index를찾아
                  _answerState[j] = true; //그 index(j)번째 선택지의 상태를 true로 바꾼다
                  _answers[_currentIndex] = j; //현재 문제의 사용자 답 변수에 index(j)를 저장
//                  print(_answers[_currentIndex]);
                } else {
                  _answerState[j] = false; //나머지 선택지들의상태를 false로 바꿈.
                }
              }
              print(_answerState);
            });
          },
        ),
      );
      _children.add(
        Padding(padding: EdgeInsets.all(width*0.024),),
      );
    }
    return _children;
  }
}
