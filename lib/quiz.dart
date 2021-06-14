import 'package:firstflutter/result.dart';
import 'package:flutter/material.dart';
import './q.dart';
import './result.dart';

class Quiz extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
// ignore: todo
// TODO: implement createState
    return _QuizState();
  }
}

//\_QuizState is now private...from Quiz only
class _QuizState extends State<Quiz> {
  List _questions = const [
    {
      'questionText': 'What\'s your favourite color?',
      'answers': [
        {"text": 'Black', "score": 10},
        {"text": 'Red', "score": 15},
        {"text": 'Blue', "score": 1}
      ],
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [
        {"text": 'Dog', "score": 1},
        {"text": 'Cat', "score": 5},
        {"text": 'Elephant', "score": 10}
      ]
    }
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    //base setup MaterialApp include named argument
    //Scaffold base design of page
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Q(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore,_resetQuiz),
      ),
    );
  }
}
