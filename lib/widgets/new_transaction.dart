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
  DateTime selectedDate;

  void addToTransaction() {
    String title = titleController.text;
    double price = double.parse(amountController.text);

    if (title.isEmpty || price < 0 || selectedDate == null) {
      return;
    }

    widget.addTx(title, price, selectedDate);
    Navigator.of(context).pop();
  }

  void showDate(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((pickedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: "Enter the title"),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Enter the amount"),
              controller: amountController,
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  selectedDate == null
                      ? "No data selected"
                      : "Picked Date:${selectedDate.toString()}",
                  style: Theme.of(context)
                      .textTheme
                      .title
                      .copyWith(fontSize: 16, color: Colors.green),
                ),
                FlatButton(
                  child: Text(
                    "Choose a Date",
                    textAlign: TextAlign.right,
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(fontSize: 16, color: Colors.green),
                  ),
                  onPressed: () {
                    showDate(context);
                  },
                ),
              ],
            ),
            RaisedButton(
              color: Colors.green,
              child: Text(
                "Add transaction",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Colors.white),
              ),
              onPressed: () {
                addToTransaction();
              },
            ),
          ],
        ),
      ),
    );
  }
}
