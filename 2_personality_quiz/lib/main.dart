import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';


void main() => runApp(App());



class App extends StatefulWidget {

	@override
	State<StatefulWidget> createState() {
		return _AppState();
	}

}



class _AppState extends State<App> {
	var _index = 0;
	var _totalScore = 0;

	static const QA = [
		{
			'question': "fav color?",
			'answers': [
				{'text':'red','score':5},
				{'text':'black','score':10},
				{'text':'blue','score':3}
			]
		},
		{
			'question': "fav animal?",
			'answers': [
				{'text':'rabbit','score':10},
				{'text':'snake','score':5},
				{'text':'elephant','score':3}
			]
		},
		{
			'question': "fav anie girl?",
			'answers': [
				{'text':'sakurajima mai','score':3},
				{'text':'chitanda eru','score':10},
				{'text':'hirasawa yui','score':5}
			]
		},
	];

	void _answerCallback(int score) {
		_totalScore += score;
		setState(() {
			_index += 1;
		});
	}

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			home: Scaffold(
				appBar: AppBar(
					title: Text('Personality Test'),
					backgroundColor: Color(0xff835858)
				),
				backgroundColor: Color(0xfffff0f0),
				body: _index < QA.length ? Quiz(_index, QA, _answerCallback) : Result(_totalScore, _resetCallback)
			)
		);
	}


	void _resetCallback() {
		setState(() {
			_index = 0;
			_totalScore = 0;
		});
	}

}
