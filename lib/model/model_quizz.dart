class Quizz{
  String title;
  List<String> candidates;
  int answer;

  Quizz({this.title, this.candidates, this.answer});

  Quizz.fromMap(Map<String, dynamic> map)
  :title=map['title'],
  candidates=map['candidates'],
  answer=map['answer'];

//  Quizz quiz = Quizz(title:'title',candidates:['a','b','c','d'],answer:0);
//
//  Quizz quiz2= Quizz.fromMap({
//    'title': 'test',
//    'candidates': ['a', 'b', 'c', 'd'],
//    'answer': 0
//  }); 같은 표현법같다

  Quizz.fromJson(Map<String, dynamic> json)
  : title = json['title'],
  candidates = json['body'].toString().split('/'),
  answer = json['answer'];
  //api로부터
}