import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = new TextEditingController();

  final amountController = new TextEditingController();

  void addToTransaction() {
    print(titleController.text);
    print(amountController.text);
    widget.addTx(
        titleController.text, double.parse(amountController.text.trim()));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: "Enter the title"),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Enter the amount"),
            ),
            RaisedButton(
              child: Text(
                "Add Transaction",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.green,
              onPressed: () {
                addToTransaction();
              },
            )
          ],
        ),
      ),
    );
  }
}
