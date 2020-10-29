import 'package:flutter/material.dart';


class NewTransaction extends StatefulWidget {

	final Function addTransactionCallback;
	NewTransaction(this.addTransactionCallback);

	@override
	_NewTransactionState createState() => _NewTransactionState();

}


class _NewTransactionState extends State<NewTransaction> {

	final titleController = TextEditingController();
	final amountController = TextEditingController();

	void addTransaction() {
		if (titleController.text.isEmpty || amountController.text.isEmpty) return;
		final amount = double.parse(amountController.text);
		if (amount <= 0) return;

		widget.addTransactionCallback(titleController.text, amount);

		Navigator.of(context).pop();
	}

	@override
	Widget build(BuildContext context) {
		return Card(
			elevation: 5,
			child: Container(
				padding: EdgeInsets.all(10),
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.end,
					children: [
						TextField(
							decoration: InputDecoration(labelText: 'Title'),
							controller: titleController,
							onSubmitted: (_) => addTransaction()
						),
						TextField(
							decoration: InputDecoration(labelText: 'Amount'),
							controller: amountController,
							keyboardType: TextInputType.number,
							onSubmitted: (_) => addTransaction()
						),
						FlatButton(
							child: Text('Add transaction'),
							textColor: Colors.purple,
							onPressed: addTransaction
						)
					]
				)
			)
		);
	}

}
