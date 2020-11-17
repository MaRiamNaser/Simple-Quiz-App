import 'package:flutter/material.dart';
import 'package:udemy_app/quiz.dart';
import 'result.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _totalScore = 0;
  final List<Map<String, Object>> _question = [
    {
      'questionText': "What is your favorite color?!",
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Green', 'score': 5},
        {'text': 'Blue', 'score': 20},
        {'text': 'Yellow', 'score': 7.5}
      ]
    },
    {
      'questionText': "What is your favorite Animal?!",
      'answers': [
        {'text': 'Lion', 'score': 30},
        {'text': 'Elephant', 'score': 2},
        {'text': 'Cat', 'score': 9},
        {'text': 'Dog', 'score': 11},
        {'text': 'Tiger', 'score': 3}
      ]
    },
    {
      'questionText': "What is your favorite Meal?!",
      'answers': [
        {'text': 'carrot', 'score': 1},
        {'text': 'Green Tea', 'score': 6},
        {'text': 'Green coffee', 'score': 4},
        {'text': 'Apple', 'score': 15},
        {'text': 'Banana', 'score': 21}
      ]
    }
  ];
  int _questionIndex = 0;

  void _resetQuiz() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  void answerQuestion(var score) {
    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    });
    print("Answer Chosen!");
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text("Quiz App"),
      ),
      body: Container(
        color: Colors.pink[100],
        child: _questionIndex < _question.length
            ? Quiz(_question, _questionIndex, answerQuestion)
            : Result(_resetQuiz, _totalScore),
      ),
    ));
  }
}
