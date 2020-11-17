import 'package:flutter/material.dart';
import 'answer.dart';
import 'question.dart';

class Quiz extends StatelessWidget {
  final question;
  final questionIndex;
  final answerQuestion;
  Quiz(this.question, this.questionIndex, this.answerQuestion);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(question[questionIndex]['questionText']),
        ...(question[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
              () => answerQuestion(answer['score']),
              answer[
                  'text']); // i want to call function answerQuestion and pass the score
          // of the chosen answer to it so i will use lamda
        }).toList(),
      ],
    );
  }
}
