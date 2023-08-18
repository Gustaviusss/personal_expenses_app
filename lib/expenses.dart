import 'package:flutter/material.dart';
import 'package:personal_expenses_app/models/expense_model.dart';
import 'package:personal_expenses_app/widgets/expenses_list_widget.dart';
import 'package:personal_expenses_app/widgets/modal_expense_form_widget.dart';

import 'swipeControllers/swipe_detector.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<ExpenseModel> _registeredExpenses = [
    ExpenseModel(
        title: 'Curso de Flutter',
        amount: 36.99,
        date: DateTime.now(),
        category: Category.contas),
    ExpenseModel(
        title: 'Cerveja do jogo',
        amount: 40.00,
        date: DateTime.now(),
        category: Category.lazer),
  ];

  void _addExpenseModal() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (_) => ModalExpenseForm(
              addExpense: registerExpense,
            ));
  }

  void registerExpense(ExpenseModel expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void deleteExpense(ExpenseModel expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      content: const Text('Gasto Removido'),
      action: SnackBarAction(
          label: 'Desfazer',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
        actions: [
          IconButton(
            onPressed: _addExpenseModal,
            icon: const Icon(Icons.add),
            iconSize: 32,
          )
        ],
      ),
      body: SwipeDetector(
        onSwipeUp: _addExpenseModal,
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('Gráfico de gastos'),
                SizedBox(
                    height: 400,
                    child: _registeredExpenses.isNotEmpty
                        ? ExpensesListWidget(
                            removeExpense: deleteExpense,
                            expenses: _registeredExpenses)
                        : Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.attach_money,
                                  size: 80,
                                  color: Colors.grey[600],
                                ),
                                Text(
                                  'Não há transações no momento',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.grey[700]),
                                )
                              ],
                            ),
                          ))
              ]),
        ),
      ),
    );
  }
}
