import 'package:flutter/material.dart';

class TransactionNotFound extends StatelessWidget {
  const TransactionNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            'Transação não encontrada',
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: constraints.maxHeight * 0.6,
            child: Image.asset('assets/images/waiting.png', fit: BoxFit.cover),
          )
        ],
      );
    });
  }
}
