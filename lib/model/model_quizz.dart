class Quizz{
  String title;
  List<String> candidates;
  int answer;

  Quizz({this.title, this.candidates, this.answer});

  Quizz.fromMap(Map<String, dynamic> map)
  :title=map['title'],
  candidates=map['candidates'],
  answer=map['answer'];

  Quizz.fromJson(Map<String, dynamic> json)
  : title = json['title'],
  candidates = json['body'].toString().split('/'),
  answer = json['answer'];
}