import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final Function restHandler;
  Result(this.score,this.restHandler);

  String get resultPhrase {
    String resultText = 'You did it';
    if (score <= 8) {
      resultText = "You are awsome";
    } else if (score <= 12) {
      resultText = "Preety likeable";
    } else if (score <= 16) {
      resultText = "You are ... strange ";
    } else {
      resultText = "You are bad";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children:<Widget> [
        Text(
          resultPhrase,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        FlatButton(child: Text("Restart quiz"),
        textColor: Colors.blue,
        onPressed: ()=>restHandler(),)
      ],
    ));
  }
}
