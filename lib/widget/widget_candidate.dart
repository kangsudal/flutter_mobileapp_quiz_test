import 'package:flutter/material.dart';

class CandWidget extends StatefulWidget {
  VoidCallback tap; //부모위젯에서 지정한  onTap을 전달해주는 기능.
  String text;
  int index;
  double width;
  bool answerState; //현재 선택지가 선택되었는지 상태

  CandWidget({this.tap, this.index, this.width, this.text, this.answerState});

  @override
  _CandWidgetState createState() => _CandWidgetState();
}

class _CandWidgetState extends State<CandWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        setState((){
          widget.tap(); //생성자에서 지정해두었던 tap 실행
          widget.answerState = !widget.answerState; //선택지선택상태여부 변수 변화
//          print(widget.text);
//          print(widget.answerState);
        });
      },
      child: Container(
        width: widget.width * 0.8,
        height: widget.width * 0.1,
//        padding: EdgeInsets.symmetric(
//          vertical: widget.width * 0.48,
//          horizontal: widget.width * 0.24,
//        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.deepPurple),
          color: widget.answerState ? Colors.deepPurple : Colors.white,//선택지가 선택되었으면  하얀색이 되도록
        ),
        child:Center(
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: widget.width * 0.035,
              color: widget.answerState ? Colors.white: Colors.black, //선택지의 text도 선택되었는지 여부에 색이바뀌도록
            ),
          ),
        ),
      ),
    );
  }
}
