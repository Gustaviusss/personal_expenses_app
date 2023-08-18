import 'package:flutter/material.dart';
import 'package:personal_expenses_app/models/expense_model.dart';
import 'package:personal_expenses_app/widgets/expense_card_widget.dart';

class ExpensesListWidget extends StatelessWidget {
  const ExpensesListWidget(
      {super.key, required this.expenses, required this.removeExpense});

  final List<ExpenseModel> expenses;
  final void Function(ExpenseModel) removeExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (_, index) => Dismissible(
        onDismissed: (direction) {
          removeExpense(expenses[index]);
        },
        key: ValueKey(expenses[index]),
        child: ExpenseCard(expense: expenses[index]),
      ),
    );
  }
}
