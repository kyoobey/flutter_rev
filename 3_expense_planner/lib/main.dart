import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './models/transaction.dart';
import './widgets/transaction_list.dart';
import './widgets/new_transaction.dart';
import './widgets/chart.dart';


void main() {
	WidgetsFlutterBinding.ensureInitialized();
	SystemChrome.setPreferredOrientations([
		DeviceOrientation.portraitUp,
		DeviceOrientation.portraitDown
	]);
	runApp(App());
}


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
		final appBar = AppBar(
			title: Text('Expense Planner'),
			actions: [
				IconButton(
					icon: Icon(Icons.add),
					onPressed: () => _startNewTransaction(context)
				)
			]
		);

		return Scaffold(
			appBar: appBar,
			body: SingleChildScrollView(child: Column(
				crossAxisAlignment: CrossAxisAlignment.center,
				children: [
					//Container(
					//	width: double.infinity,
					//	child: Card(
					//		child: Text('CHART'),
					//		color: Colors.blue,
					//		elevation: 5
					//	)
					//),
					Container(
						height: (	MediaQuery.of(context).size.height 
									- appBar.preferredSize.height
									- MediaQuery.of(context).padding.top) * 0.3,
						child: Chart(_recentTransactions)
					),
					Container(
						height: (	MediaQuery.of(context).size.height 
									- appBar.preferredSize.height
									- MediaQuery.of(context).padding.top) * 0.7,
						child: TransactionList(_transactions, _deleteTransaction)
					)
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
