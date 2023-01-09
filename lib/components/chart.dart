import 'package:expenses/components/chart_bar.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  const Chart(this.recentTransaction, {super.key});

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0.0;

      for (var element in recentTransaction) {
        if (!DateUtils.isSameDay(element.date, weekDay)) continue;
        totalSum += element.value;
      }

      Map<String, Object> groupedTransaction = {
        'day': DateFormat.E().format(weekDay)[0].toUpperCase(),
        'value': totalSum,
      };

      return groupedTransaction;
    }).reversed.toList();
  }

  double get totalValue {
    return groupedTransactions.fold(
      0.0,
      (previousValue, element) =>
          previousValue + double.parse(element['value'].toString()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactions.map((tr) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                  transaction: tr,
                  percentage:
                      (double.parse(tr['value'].toString()) / totalValue)),
            );
          }).toList(),
        ),
      ),
    );
  }
}
