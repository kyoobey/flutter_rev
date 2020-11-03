import 'package:flutter/material.dart';

import './models/transaction.dart';
import './widgets/transaction_list.dart';
import './widgets/new_transaction.dart';
import './widgets/chart.dart';


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
					),
					button: TextStyle(color: Colors.white)
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

	bool _showChart = false;

	List<Transaction> get _recentTransactions {
		return _transactions.where((transaction) {
			return transaction.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
		}).toList();
	}

	void _addTransaction(String title, double amount, DateTime date) {
		final newTransaction = Transaction(
			title: title,
			amount: amount,
			date: date,
			id: DateTime.now().toString()
		);

		setState(() {
			_transactions.add(newTransaction);
		});
	}

	void _deleteTransaction(String id) {
		setState(() {
			_transactions.removeWhere((transaction) => transaction.id == id);
		});
	}

	void _startNewTransaction(ctx) {
		showModalBottomSheet(context: ctx, builder: (_) {
			return NewTransaction(_addTransaction);
		});
	}

	@override
	Widget build(BuildContext context) {
		final mediaQuery = MediaQuery.of(context);

		final isLandspace = mediaQuery.orientation == Orientation.landscape;

		final appBar = AppBar(
			title: Text('Expense Planner'),
			actions: [
				IconButton(
					icon: Icon(Icons.add),
					onPressed: () => _startNewTransaction(context)
				)
			]
		);

		final transactionList = Container(
			height: (	mediaQuery.size.height 
						- appBar.preferredSize.height
						- mediaQuery.padding.top) * 0.7,
			child: TransactionList(_transactions, _deleteTransaction)
		);

		return Scaffold(
			appBar: appBar,
			body: SingleChildScrollView(child: Column(
				crossAxisAlignment: CrossAxisAlignment.center,
				children: [
					if (isLandspace) Row(
						mainAxisAlignment: MainAxisAlignment.center,
						children: [
							Text('Show Chart'),
							Switch(value: _showChart, onChanged: (val) {
								setState(() {
									_showChart = val;
								});
							})
						]
					),
					if (!isLandspace) Container(
							height: (	mediaQuery.size.height 
										- appBar.preferredSize.height
										- mediaQuery.padding.top) * 0.3,
							child: Chart(_recentTransactions)
						),
					if (!isLandspace) transactionList,
					if (isLandspace) _showChart
						? Container(
							height: (	mediaQuery.size.height 
										- appBar.preferredSize.height
										- mediaQuery.padding.top) * 0.7,
							child: Chart(_recentTransactions)
						)
						: transactionList
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
