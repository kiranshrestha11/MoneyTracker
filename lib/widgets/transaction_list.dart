import 'package:flutter/material.dart';
import 'package:moneytracker/model/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransaction;
  final Function _deleteTx;
  TransactionList(this._userTransaction, this._deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: _userTransaction.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  "No transaction available",
                  style: Theme.of(context).textTheme.title,
                ),
                Image.asset(
                  "assets/images/box.png",
                  fit: BoxFit.contain,
                ),
              ],
            )
          : ListView.builder(
              itemCount: _userTransaction.length,
              itemBuilder: (ctx, i) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: FittedBox(
                            child: Text(_userTransaction[i].price.toString())),
                      ),
                    ),
                    title: Text(
                      _userTransaction[i].title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    subtitle: Text(
                      _userTransaction[i].dateTime.toString(),
                      style: TextStyle(fontSize: 18),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        _deleteTx(_userTransaction[i].id);
                      },
                    ),
                  ),
                );
              }),
    );
  }
}
