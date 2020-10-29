import 'package:flutter/material.dart';


class NewTransaction extends StatelessWidget {

	final titleController = TextEditingController();
	final amountController = TextEditingController();

	final Function addTransactionCallback;

	NewTransaction(this.addTransactionCallback);

	void addTransaction() {
		if (titleController.text.isEmpty || amountController.text.isEmpty) return;
		final amount = double.parse(amountController.text);
		if (amount <= 0) return;

		addTransactionCallback(titleController.text, amount);
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
							decoration: InputDecoration(
								labelText: 'Title'
							),
							controller: titleController,
							onSubmitted: (_) => addTransaction()
							//onChanged: (val) => titleInput = val
						),
						TextField(
							decoration: InputDecoration(
								labelText: 'Amount'
							),
							controller: amountController,
							keyboardType: TextInputType.number,
							onSubmitted: (_) => addTransaction()
							//onChanged: (val) => amountInput = val
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
