import 'dart:math';

import 'package:expenses/components/adaptable/adaptable_scaffold.dart';
import 'package:expenses/components/chart.dart';
import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/components/transaction_list.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Transaction> transaction = [];

  List<Transaction> get _recentTransactions {
    return transaction.where((element) {
      return element.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  _addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: date,
    );

    setState(() {
      transaction.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  _removeTransaction(String id) {
    setState(() {
      transaction.removeWhere((element) => element.id == id);
    });
  }

  _openTransactionFormDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) {
          return TransactionForm(_addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    Intl.defaultLocale = 'pt_BR';
    final mediaQuery = MediaQuery.of(context);

    bool portrait = mediaQuery.orientation == Orientation.portrait;

    PreferredSizeWidget appBar = AppBar(
      title: Text('Despesas Pessoais'),
      actions: [
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => _openTransactionFormDialog(context),
        )
      ],
    );

    print(Theme.of(context).appBarTheme);

    ObstructingPreferredSizeWidget navigationBar = CupertinoNavigationBar(
      middle: Text('Despesas Pessoais'),
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            child:
                Icon(CupertinoIcons.add, color: Theme.of(context).primaryColor),
            onTap: () => _openTransactionFormDialog(context),
          ),
        ],
      ),
    );

    double availableHeight = mediaQuery.size.height -
        appBar.preferredSize.height -
        mediaQuery.padding.top;

    double availableWidth = mediaQuery.size.width;

    return AdaptableScaffold(
      appBar: appBar,
      navigationBar: navigationBar,
      body: portrait
          ? Column(
              children: [
                SizedBox(
                  height: availableHeight * 0.35,
                  child: Chart(_recentTransactions),
                ),
                SingleChildScrollView(
                  child: SizedBox(
                    height: ((availableHeight) * 0.60 -
                        mediaQuery.viewInsets.bottom),
                    child: TransactionList(
                      transaction: transaction,
                      onRemove: _removeTransaction,
                    ),
                  ),
                ),
              ],
            )
          : Row(
              children: [
                SizedBox(
                  width: availableWidth * 0.45,
                  child: Chart(_recentTransactions),
                ),
                SingleChildScrollView(
                  child: SizedBox(
                    height: availableHeight,
                    width: availableWidth * 0.50,
                    child: TransactionList(
                      transaction: transaction,
                      onRemove: _removeTransaction,
                    ),
                  ),
                ),
              ],
            ),
      fab: FloatingActionButton(
        onPressed: () => _openTransactionFormDialog(context),
        child: Icon(Icons.add),
      ),
      fabLocation: portrait
          ? FloatingActionButtonLocation.endFloat
          : FloatingActionButtonLocation.centerFloat,
    );
  }
}
