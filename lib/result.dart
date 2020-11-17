import 'package:flutter/material.dart';
import 'main.dart';

class Result extends StatelessWidget {
  final Function z;
  final resultScore;

  Result(this.z, this.resultScore);

  String get resultPhrase {
    String resultText;
    if (resultScore >= 70) {
      resultText = " You are awesome !";
    } else if (resultScore >= 40) {
      resultText = "Pretty likable";
    } else {
      resultText = "You are so bad !";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
          Widget>[
        Text(
          "Your Score is ${this.resultScore}",
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: b),
        ),
        Text(
          this.resultPhrase,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: b),
        ),
        FlatButton(
          child: Text("Retart the App ?",
              style: TextStyle(fontSize: 30, color: b)),
          onPressed: z,
        ),
      ]),
    );
  }
}
