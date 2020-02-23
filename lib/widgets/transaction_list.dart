import 'package:flutter/material.dart';
import 'package:moneytracker/model/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransaction;
  TransactionList(this._userTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(
          itemCount: _userTransaction.length,
          itemBuilder: (ctx, i) {
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  child: Text(_userTransaction[i].price.toString()),
                ),
                title: Text(
                  _userTransaction[i].title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                subtitle: Text(
                  _userTransaction[i].dateTime.toString(),
                  style: TextStyle(fontSize: 18),
                ),
              ),
            );
          }),
    );
  }
}
