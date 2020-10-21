import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandeler;

  Result(this.resultScore, this.resetHandeler);

  String get resultPhrase {
    var resultText = 'You did it!';
    if (resultScore <= 8) {
      resultText += '\nYou are awsome!';
    } else if (resultScore <= 12) {
      resultText += '\nLikeable!';
    } else {
      resultText += '\nYou are strange!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          FlatButton(
            child: Text('Restart Quiz!'),
            onPressed: resetHandeler,
          )
        ],
      ),
    );
  }
}
