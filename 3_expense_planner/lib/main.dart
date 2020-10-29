import 'package:flutter/material.dart';

import './widgets/user_transactions.dart';


void main() => runApp(App());


class App extends StatelessWidget {

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Expense Planner',
			home: HomePage(),
		);
	}

}

class HomePage extends StatelessWidget {

	//String titleInput;
	//String amountInput;

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Expense Planner'),
			),
			body: SingleChildScrollView(child: Column(
				// mainAxisAlignment: MainAxisAlignment.start,
				crossAxisAlignment: CrossAxisAlignment.center,
				children: [
					Container(
						width: double.infinity,
						child: Card(
							child: Text('CHART'),
							color: Colors.blue,
							elevation: 5
						)
					),
					UserTransactions()
				]
			))
		);
	}

}
