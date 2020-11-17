import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _question = [
    "What\'s your favorite color?",
    "What\'s your favorite animal?",
    "What\'s your favorite meal?"
  ];
  int _questionIndex = 0;

  void answerQuestion() {
    if (_questionIndex == _question.length - 1) {
      _questionIndex = -1;
    }
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
          child: Column(
            children: <Widget>[
              Question(_question[_questionIndex]),
              Answer(answerQuestion, "Answer 1"),
              Answer(answerQuestion, "Answer 2"),
              Answer(answerQuestion, "Answer 3"),
            ],
          ),
        ),
      ),
    );
  }
}
