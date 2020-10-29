import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';


class TransactionList extends StatelessWidget {

	final List<Transaction> transactions;

	TransactionList(this.transactions);

	@override
	Widget build(BuildContext context) {
		return Container(
			height: 300,
			child: ListView.builder(
				itemCount: transactions.length,
				itemBuilder: (ctx, idx) {
					final transaction = transactions[idx];
					return Card(
						child: Row(children: [
							Container(
								margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
								decoration: BoxDecoration(border: Border.all(
									color: Colors.purple,
									width: 2
								)),
								padding: EdgeInsets.all(10),
								child: Text('💸 ${transaction.amount}', style: TextStyle(
									fontWeight: FontWeight.bold,
									fontSize: 20,
									color: Colors.purple
								))
							),
							Column(
								crossAxisAlignment: CrossAxisAlignment.start,
								children: [
									Text(transaction.title, style: TextStyle(
										fontWeight: FontWeight.bold,
										fontSize: 16
									)),
									Text(
										DateFormat.yMMMd().format(transaction.date),
										style: TextStyle(
											fontSize: 10,
											color: Colors.grey
										)
									),
								]
							)
						])
					);
				}
			)
		);
	}
}
