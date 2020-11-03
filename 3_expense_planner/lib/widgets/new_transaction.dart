import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class NewTransaction extends StatefulWidget {

	final Function addTransactionCallback;
	NewTransaction(this.addTransactionCallback);

	@override
	_NewTransactionState createState() => _NewTransactionState();

}


class _NewTransactionState extends State<NewTransaction> {

	final _titleController = TextEditingController();
	final _amountController = TextEditingController();

	DateTime _date;

	void _addTransaction() {
		if (_titleController.text.isEmpty || _amountController.text.isEmpty || _date==null) return;
		final amount = double.parse(_amountController.text);
		if (amount <= 0) return;

		widget.addTransactionCallback(_titleController.text, amount, _date);

		Navigator.of(context).pop();
	}

	void _datePicker() {
		showDatePicker(
			context: context,
			initialDate: DateTime.now(),
			firstDate: DateTime(2019),
			lastDate: DateTime.now()
		).then((date) {
			if (date==null) return;
			setState(() {
				_date = date;
			});
		});
	}

	@override
	Widget build(BuildContext context) {
		return SingleChildScrollView(child: Card(
			elevation: 5,
			child: Container(
				padding: EdgeInsets.only(top: 10, left: 10, right: 10,
					bottom: MediaQuery.of(context).viewInsets.bottom + 10
				),
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.end,
					children: [
						TextField(
							decoration: InputDecoration(labelText: 'Title'),
							controller: _titleController,
							onSubmitted: (_) => _addTransaction()
						),
						TextField(
							decoration: InputDecoration(labelText: 'Amount'),
							controller: _amountController,
							keyboardType: TextInputType.number,
							onSubmitted: (_) => _addTransaction()
						),
						Container(
							height: 70,
							child: Row(children: [
								Expanded(child: Text(_date==null
									? 'no date chosen'
									: 'picked date: ${DateFormat.yMd().format(_date)}'
								)),
								FlatButton(
									textColor: Theme.of(context).primaryColor,
									child: Text('choose date', style: TextStyle(fontWeight: FontWeight.bold)),
									onPressed: _datePicker
								)
							])
						),
						RaisedButton(
							child: Text('Add transaction', style: TextStyle(fontWeight: FontWeight.bold)),
							color: Theme.of(context).primaryColor,
							textColor: Theme.of(context).textTheme.button.color,
							onPressed: _addTransaction
						)
					]
				)
			)
		));
	}

}
