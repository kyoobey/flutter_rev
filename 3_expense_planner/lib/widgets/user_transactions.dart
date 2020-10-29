import 'package:flutter/material.dart';

import './transaction_list.dart';
import './new_transaction.dart';
import '../models/transaction.dart';


class UserTransactions extends StatefulWidget {
	@override
	_UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {

	final List<Transaction> _transactions = [
		Transaction(id: 't1', title: 'shoes', amount: 1299.99, date: DateTime.now()),
		Transaction(id: 't2', title: 'shirts', amount: 699.99, date: DateTime.now())
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

	@override
	Widget build(BuildContext context) {
		return Column(children: [
			NewTransaction(_addTransaction),
			TransactionList(_transactions)
		]);
	}
}
