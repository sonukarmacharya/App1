import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';

class Q extends StatelessWidget {
  final List questions;
  final int questionIndex;
  final Function answerQuestion;

  Q(
      {required this.questions,
      required this.answerQuestion,
      required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Questions(
          questions[questionIndex]['questionText'],
        ),
        ...(questions[questionIndex]['answers'] as List).map((answer) {
          return Answer(()=>answerQuestion(answer['score']), answer['text']);
        }).toList()
      ],
    );
  }
}
