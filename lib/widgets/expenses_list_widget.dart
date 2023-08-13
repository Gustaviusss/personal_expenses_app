import 'package:flutter/material.dart';
import 'package:personal_expenses_app/models/expense_model.dart';
import 'package:personal_expenses_app/widgets/expense_card_widget.dart';

class ExpensesListWidget extends StatefulWidget {
  const ExpensesListWidget({super.key, required this.expenses});

  final List<ExpenseModel> expenses;

  @override
  State<ExpensesListWidget> createState() => _ExpensesListWidgetState();
}

class _ExpensesListWidgetState extends State<ExpensesListWidget> {
  void removeExpense(index) {
    setState(() {
      widget.expenses.remove(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.expenses.length,
      itemBuilder: (_, index) => ExpenseCard(
        expense: widget.expenses[index],
        removeExpense: () => removeExpense(widget.expenses[index]),
      ),
    );
  }
}
