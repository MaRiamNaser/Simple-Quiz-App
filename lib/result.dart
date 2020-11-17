import 'package:flutter/material.dart';

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
      child: Column(children: <Widget>[
        Text(
          "${this.resultScore}",
          style: TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.bold,
              color: Colors.pinkAccent),
        ),
        Text(
          this.resultPhrase,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        FlatButton(
          child: Text("Retart the App ?",
              style: TextStyle(fontSize: 30, color: Colors.blue)),
          onPressed: z,
        ),
      ]),
    );
  }
}
