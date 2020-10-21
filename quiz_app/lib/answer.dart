import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answerText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        child: Text(answerText),
        textColor: Colors.white,
        color: Color.fromRGBO(45, 12, 120, 0.45),
        onPressed: selectHandler,
      ),
    );
  }
  Answer(this.selectHandler, this.answerText);
}
