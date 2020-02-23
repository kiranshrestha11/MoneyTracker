import 'package:flutter/material.dart';
import 'package:moneytracker/model/transaction.dart';
import 'package:moneytracker/widgets/chartbar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> _recentTransaction;
  Chart(this._recentTransaction);

  List<Map<String, Object>> get groupedTransaction {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;
      for (int i = 0; i < _recentTransaction.length; i++) {
        if (_recentTransaction[i].dateTime.day == weekDay.day &&
            _recentTransaction[i].dateTime.month == weekDay.month &&
            _recentTransaction[i].dateTime.year == weekDay.year) {
          totalSum += _recentTransaction[i].price;
        }
      }
      return {'day': "S", 'amount': totalSum};
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransaction.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 6,
        margin: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: groupedTransaction.map((tx) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                tx["amount"] as double,
                tx["day"],
                totalSpending == 0.0
                    ? 0.0
                    : (tx['amount'] as double) / totalSpending,
              ),
            );
          }).toList(),
        ));
  }
}
