import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final Function z;

  Result(this.z);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: <Widget>[
        Text(
          "Done !",
          style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
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
