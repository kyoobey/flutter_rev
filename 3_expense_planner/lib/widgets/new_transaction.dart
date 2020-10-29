import 'package:flutter/material.dart';


class NewTransaction extends StatelessWidget {

	final titleController = TextEditingController();
	final amountController = TextEditingController();

	final Function addTransactionCallback;

	NewTransaction(this.addTransactionCallback);

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
							controller: titleController
							//onChanged: (val) => titleInput = val
						),
						TextField(
							decoration: InputDecoration(
								labelText: 'Amount'
							),
							controller: amountController
							//onChanged: (val) => amountInput = val
						),
						FlatButton(
							child: Text('Add transaction'),
							textColor: Colors.purple,
							onPressed: () => addTransactionCallback(titleController.text, double.parse(amountController.text))
						)
					]
				)
			)
		);
	}

}
