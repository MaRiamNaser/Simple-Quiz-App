import 'package:flutter/material.dart';
import 'package:udemy_app/quiz.dart';
import 'result.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

Color w = Colors.pinkAccent;
Color b = Colors.black;

class _MyAppState extends State<MyApp> {
  int _totalScore = 0;
  bool isSwitched = false;
  final List<Map<String, Object>> _question = [
    {
      'questionText': "What is your favorite color?!",
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Green', 'score': 20},
        {'text': 'Blue', 'score': 30},
        {'text': 'Yellow', 'score': 40}
      ]
    },
    {
      'questionText': "What is your favorite Animal?!",
      'answers': [
        {'text': 'Lion', 'score': 10},
        {'text': 'Elephant', 'score': 20},
        {'text': 'Cat', 'score': 30},
        {'text': 'Dog', 'score': 40},
        {'text': 'Tiger', 'score': 50}
      ]
    },
    {
      'questionText': "What is your favorite Meal?!",
      'answers': [
        {'text': 'carrot', 'score': 10},
        {'text': 'Green Tea', 'score': 20},
        {'text': 'Green coffee', 'score': 30},
        {'text': 'Apple', 'score': 40},
        {'text': 'Banana', 'score': 50}
      ]
    }
  ];
  int _questionIndex = 0;

  int numScore = 0;
  void _resetQuiz() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  void answerQuestion(var score) {
    this.numScore = score;
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
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: w,
            title: Text(
              "Quiz App",
              style: TextStyle(color: b),
            ),
            actions: <Widget>[
              Switch(
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                    if (isSwitched == true) {
                      b = Colors.pink;
                      w = Colors.black;
                    }
                    if (isSwitched == false) {
                      b = Colors.black;
                      w = Colors.pink;
                    }
                  });
                },
                activeColor: Colors.pink,
                inactiveThumbColor: Colors.black,
                inactiveTrackColor: Colors.black,
              )
            ],
          ),
          body: Container(
            color: w,
            child: _questionIndex < _question.length
                ? Quiz(_question, _questionIndex, answerQuestion)
                : Result(_resetQuiz, _totalScore),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: b,
            child: Icon(
              Icons.arrow_back,
              color: w,
              size: 40,
            ),
            onPressed: () {
              setState(() {
                if (_questionIndex > 0) {
                  _questionIndex--;
                  _totalScore -= numScore;
                }
              });
            },
          ),
        ));
  }
}
