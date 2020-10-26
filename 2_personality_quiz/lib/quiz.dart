import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';



class Quiz extends StatelessWidget {

	final QA;
	final index;
	final Function answerCallback;

	Quiz(this.index, this.QA, this.answerCallback);

	@override
	Widget build(BuildContext context) {
		return Column(children: [
			Question(QA[index]['question']),
			...(QA[index]['answers'] as List<Map<String,Object>>).map((answer) {
				return Answer(answer['text'], () => answerCallback(answer['score']));
			}).toList()
		]);
	}
}


