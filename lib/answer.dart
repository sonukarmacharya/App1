import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answerText;
  Answer(this.selectHandler, this.answerText);
  void _answerQuestion() {
// setState(() {
// _questionIndex = _questionIndex + 1;
// });
    print("click");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        child: Text(answerText),
        onPressed: () =>  selectHandler() ,
      ),
    );
  }
}
