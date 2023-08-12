import 'package:flutter/material.dart';
import 'package:personal_expenses_app/models/expense_model.dart';

class ExpensesListWidget extends StatefulWidget {
  const ExpensesListWidget({super.key, required this.expenses});

  final List<ExpenseModel> expenses;

  @override
  State<ExpensesListWidget> createState() => _ExpensesListWidgetState();
}

class _ExpensesListWidgetState extends State<ExpensesListWidget> {
  @override
  Widget build(BuildContext context) {
    IconData? selectedIcon;
    IconData? getIcon({required Category category}) {
      switch (category) {
        case Category.alimentacao:
          selectedIcon = Icons.food_bank_outlined;
          break;
        case (Category.contas):
          selectedIcon = Icons.receipt;
          break;
        case (Category.lazer):
          selectedIcon = Icons.terrain_rounded;
          break;
        case (Category.viagem):
          selectedIcon = Icons.flight;
          break;
        default:
          selectedIcon = Icons.menu;
      }
      return selectedIcon;
    }

    void removeExpense(index) {
      setState(() {
        widget.expenses.remove(index);
      });
    }

    return ListView.builder(
        itemCount: widget.expenses.length,
        itemBuilder: (_, index) => Card(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              color: const Color.fromARGB(255, 247, 205, 241),
              elevation: 10,
              child: ListTile(
                trailing: IconButton.filled(
                    onPressed: () {
                      removeExpense(widget.expenses[index]);
                    },
                    icon: const Icon(Icons.delete)),
                iconColor: Colors.deepPurple,
                leading: Icon(
                  getIcon(category: widget.expenses[index].category),
                  size: 36,
                ),
                title: Text(widget.expenses[index].title),
                subtitle: Text(
                    "${widget.expenses[index].amount} | ${widget.expenses[index].date}"),
              ),
            ));
  }
}
