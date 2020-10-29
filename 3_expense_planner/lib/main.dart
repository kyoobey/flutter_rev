import 'package:flutter/material.dart';

import './widgets/transaction_list.dart';
import './widgets/new_transaction.dart';
import './models/transaction.dart';


void main() => runApp(App());


class App extends StatelessWidget {

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Expense Planner',
			home: HomePage(),
			theme: ThemeData(
				primarySwatch: Colors.purple,
				accentColor: Colors.amber,
				fontFamily: 'Quicksand',
				textTheme: ThemeData.light().textTheme.copyWith(
					title: TextStyle(
						fontFamily: 'OpenSans',
						fontWeight: FontWeight.bold,
						fontSize: 16
					)
				),
				appBarTheme: AppBarTheme(textTheme: ThemeData.light().textTheme.copyWith(
					title: TextStyle(
						fontFamily: 'OpenSans',
						fontSize: 20,
						fontWeight: FontWeight.bold
					)
				))
			)
		);
	}

}


class HomePage extends StatefulWidget {

	@override
	_HomePageState createState() => _HomePageState();

}


class _HomePageState extends State<HomePage> {

	final List<Transaction> _transactions = [
		//Transaction(id: 't1', title: 'shoes', amount: 1299.99, date: DateTime.now()),
	];

	void _addTransaction(String title, double amount) {
		final newTransaction = Transaction(
			title: title,
			amount: amount,
			date: DateTime.now(),
			id: DateTime.now().toString()
		);

		setState(() {
			_transactions.add(newTransaction);
		});
	}

	void _startNewTransaction(ctx) {
		showModalBottomSheet(context: ctx, builder: (_) {
			return NewTransaction(_addTransaction);
		});
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Expense Planner'),
				actions: [
					IconButton(
						icon: Icon(Icons.add),
						onPressed: () => _startNewTransaction(context)
					)
				]
			),
			body: SingleChildScrollView(child: Column(
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
					TransactionList(_transactions)
				]
			)),
			floatingActionButton: FloatingActionButton(
				child: Icon(Icons.add),
				onPressed: () => _startNewTransaction(context)
			),
			floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
		);
	}

}
