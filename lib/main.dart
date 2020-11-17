import 'package:flutter/material.dart';
import 'package:udemy_app/quiz.dart';
import 'result.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Map<String, Object>> _question = [
    {
      'questionText': "What is your favorite color?!",
      'answers': ['Black', 'Green', 'Blue', 'Yellow']
    },
    {
      'questionText': "What is your favorite Animal?!",
      'answers': ['Lion', 'Elephant', 'Cat', 'Dog', 'Tiger']
    },
    {
      'questionText': "What is your favorite Meal?!",
      'answers': ['carrot', 'Green Tea', 'Green coffee', 'Apple', 'Banana']
    }
  ];
  int _questionIndex = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
    });
  }

  void answerQuestion() {
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
        title: Text("Quiz App"),
      ),
      body: Container(
        child: _questionIndex < _question.length
            ? Quiz(_question, _questionIndex, answerQuestion)
            : Result(_resetQuiz),
      ),
    ));
  }
}
