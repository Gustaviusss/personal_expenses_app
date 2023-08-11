import 'package:flutter/material.dart';
import 'package:personal_expenses_app/models/expense_model.dart';

class ExpensesListWidget extends StatelessWidget {
  const ExpensesListWidget({super.key, required this.expenses});

  final List<ExpenseModel> expenses;

  @override
  Widget build(BuildContext context) {
    IconData getIcon({required Category category}) {
      IconData selectedIcon = Icons.ads_click_rounded;
      switch (category) {
        case Category.alimentacao:
          Icons.food_bank_outlined;
          break;
        case (Category.contas):
          Icons.receipt;
          break;
        case (Category.lazer):
          Icons.terrain_rounded;
          break;
        case (Category.viagem):
          Icons.flight;
          break;
        default:
          Icons.menu;
      }
      return selectedIcon;
    }

    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (_, index) => Card(
              elevation: 10,
              child: ListTile(
                iconColor: Colors.deepPurple,
                leading: Icon(
                  getIcon(category: expenses[index].category),
                  size: 36,
                ),
                title: Text(expenses[index].title),
                subtitle:
                    Text("${expenses[index].amount} | ${expenses[index].date}"),
              ),
            ));
  }
}
