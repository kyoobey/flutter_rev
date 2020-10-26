import 'package:flutter/material.dart';



class Answer extends StatelessWidget {
	final String text;
	final Function answerCallback;

	Answer(this.text, this.answerCallback);

	@override
	Widget build(BuildContext context) {
		return Container(
			width: double.infinity,
			child: RaisedButton(
				child: Text(text),
				onPressed: answerCallback,
				color: Color(0xffebd4d4),
				textColor: Colors.white
			)
		);
	}

}




