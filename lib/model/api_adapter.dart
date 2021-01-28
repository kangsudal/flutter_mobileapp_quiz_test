import 'dart:convert';
import 'model_quizz.dart';

List<Quizz> parseQuizzs(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Quizz>((json)=>Quizz.fromJson(json)).toList();
  /*
    responseBody: String
    ->
    parsed: CastList<dynamic, Map<String, dynamic>>
    ->
    List<Quizz>

    String->Json->Quizz
    String->List<Json>->List<Quizz>
   */
}