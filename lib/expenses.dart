import 'package:flutter/material.dart';
import 'package:personal_expenses_app/models/expense_model.dart';
import 'package:personal_expenses_app/widgets/expenses_list_widget.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
            iconSize: 32,
          )
        ],
      ),
      body: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          const Text('Gráfico de gastos'),
          SizedBox(
              height: 400,
              child: _registeredExpenses.isNotEmpty
                  ? ExpensesListWidget(expenses: _registeredExpenses)
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
    );
  }
}
