import 'package:flutter/material.dart';
import 'package:personal_expenses_app/models/expense_model.dart';

class ExpenseCard extends StatelessWidget {
  const ExpenseCard({super.key, required this.expense});

  final ExpenseModel expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      color: const Color.fromARGB(255, 247, 205, 241),
      elevation: 10,
      child: ListTile(
        iconColor: Colors.deepPurple,
        leading: Icon(
          categoryIcons[expense.category],
          size: 36,
        ),
        title: Text(expense.title),
        subtitle: Text("R\$ "
            "${expense.amount.toStringAsFixed(2)} | ${expense.formattedDate}"),
      ),
    );
  }
}
