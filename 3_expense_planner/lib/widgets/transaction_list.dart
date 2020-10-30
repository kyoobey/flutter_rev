import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';


class TransactionList extends StatelessWidget {

	final List<Transaction> transactions;
	final Function deleteTransactionCallback;

	TransactionList(this.transactions, this.deleteTransactionCallback);

	@override
	Widget build(BuildContext context) {
		return Container(
			height: 450,
			child: transactions.isEmpty
				? Column(children: [
					Text(
						'No transactions added yet',
						style: Theme.of(context).textTheme.title
					),
					SizedBox(height: 20),
					Container(
						height: 200,
						child: Image.asset(
							'assets/images/waiting.png',
							fit: BoxFit.cover
						)
					)
				])
				: ListView.builder(
					itemCount: transactions.length,
					itemBuilder: (ctx, idx) {
						final transaction = transactions[idx];

						return Card(
							margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
							elevation: 5,
							child: ListTile(
								leading: CircleAvatar(
									radius: 30,
									child: Padding(
										padding: EdgeInsets.all(6),
										child: FittedBox(child: Text('\$${transaction.amount.toStringAsFixed(2)}'))
									)
								),
								title: Text(transaction.title, style: Theme.of(context).textTheme.title),
								subtitle: Text(DateFormat.yMMMd().format(transaction.date)),
								trailing: IconButton(
									icon: Icon(Icons.delete),
									color: Theme.of(context).errorColor,
									onPressed: () => deleteTransactionCallback(transaction.id)
								)
							)
						);
					}
				)
		);
	}
}
