import 'package:flutter/material.dart';



class Result extends StatelessWidget {
	final int score;
	final Function resetCallback;

	Result(this.score, this.resetCallback);

	String get comment {
		if (score == 30) {
			return 'purrfect';
		} else if (score >= 20) {
			return 'ok...';
		} else if (score >= 10) {
			return 'bad score :(';
		} else {
			return 'lmao !!\nyou have bad taste';
		}
	}

	@override
	Widget build(BuildContext context) {
		return Center(child: Column(
			children: [
				Text(
					comment,
					textAlign: TextAlign.center,
					style: TextStyle(
						fontSize: 20,
						fontWeight: FontWeight.bold
					)
				),
				FlatButton(
					child: Text('restart'),
					onPressed: resetCallback
				)
			]
		));
	}
}


