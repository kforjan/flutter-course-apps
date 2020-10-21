import 'package:first_app/quiz.dart';
import 'package:first_app/result.dart';
import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex++;
    });
  }

  void _restartQuiz() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  void _previousQuestion() {
    setState(() {
      if (_questionIndex > 0) {
        _questionIndex--;
      }
    });
  }

  static const _questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answer': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
      ]
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answer': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Tiger', 'score': 10},
        {'text': 'Elephant', 'score': 5},
      ]
    },
    {
      'questionText': 'Who\'s your favourite instructor?',
      'answer': [
        {'text': 'Max', 'score': 1},
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Application'),
          backgroundColor: Color.fromRGBO(45, 12, 120, 1),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
                previousQuestion: _previousQuestion,
              )
            : Result(_totalScore, _restartQuiz),
      ),
    );
  }
}
