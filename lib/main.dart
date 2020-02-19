import 'package:flutter/material.dart';
import 'package:moneytracker/model/transaction.dart';
import 'package:moneytracker/widgets/new_transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Money Tracker",
      home: MoneyTrackPage(),
    );
  }
}

class MoneyTrackPage extends StatefulWidget {
  @override
  _MoneyTrackPageState createState() => _MoneyTrackPageState();
}

class _MoneyTrackPageState extends State<MoneyTrackPage> {
  List<Transaction> _userTransaction = [
    Transaction(title: "Watch", price: 2000, dateTime: DateTime.now()),
    Transaction(title: "Groceries", price: 1000, dateTime: DateTime.now()),
    Transaction(title: "Laptop", price: 4000, dateTime: DateTime.now()),
  ];
  void _addTransaction(String txTitle, double txPrice) {
    Transaction newTx = new Transaction(
        title: txTitle, price: txPrice, dateTime: DateTime.now());
    setState(() {
      _userTransaction.add(newTx);
    });
  }

  void showBtSheet(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bctx) {
          return NewTransaction(_addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Money Tracker"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              showBtSheet(context);
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Card(
            child: Container(
              width: double.infinity,
              child: Text("Chart"),
            ),
          ),
          Column(
              children: _userTransaction.map((tx) {
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  child: Text(tx.price.toString()),
                ),
                title: Text(
                  tx.title,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                subtitle: Text(
                  tx.dateTime.toString(),
                  style: TextStyle(fontSize: 18),
                ),
              ),
            );
          }).toList())
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showBtSheet(context);
        },
      ),
    );
  }
}
