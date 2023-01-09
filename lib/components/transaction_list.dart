import 'package:expenses/components/transaction_list_card.dart';
import 'package:expenses/components/transaction_not_found.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function(String) onRemove;

  const TransactionList({
    super.key,
    required this.transaction,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return transaction.isEmpty
        ? TransactionNotFound()
        : ListView.builder(
            itemCount: transaction.length,
            itemBuilder: (context, index) {
              final tr = transaction[index];
              return TransactionListCard(
                transaction: tr,
                onRemove: onRemove,
              );
            },
          );
  }
}
