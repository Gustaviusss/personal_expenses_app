import 'package:flutter/material.dart';
import 'package:personal_expenses_app/models/expense_model.dart';
import 'package:personal_expenses_app/widgets/expenses_list_widget.dart';
import 'package:intl/intl.dart';

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
        date: DateFormat('EEEE, dd/MM/yyyy').format(DateTime.now()),
        category: Category.contas),
    ExpenseModel(
        title: 'Cerveja do jogo',
        amount: 40.00,
        date: DateFormat('EEEE, dd/MM/yyyy').format(DateTime.now()),
        category: Category.lazer),
    ExpenseModel(
        title: 'Curso de Flutter',
        amount: 36.99,
        date: DateFormat('EEEE, dd/MM/yyyy').format(DateTime.now()),
        category: Category.viagem),
    ExpenseModel(
        title: 'Cerveja do jogo',
        amount: 40.00,
        date: DateFormat('EEEE, dd/MM/yyyy').format(DateTime.now()),
        category: Category.alimentacao),
    ExpenseModel(
        title: 'Curso de Flutter',
        amount: 36.99,
        date: DateFormat('EEEE, dd/MM/yyyy').format(DateTime.now()),
        category: Category.contas),
    ExpenseModel(
        title: 'Cerveja do jogo',
        amount: 40.00,
        date: DateFormat('EEEE, dd/MM/yyyy').format(DateTime.now()),
        category: Category.lazer),
    ExpenseModel(
        title: 'Curso de Flutter',
        amount: 36.99,
        date: DateFormat('EEEE, dd/MM/yyyy').format(DateTime.now()),
        category: Category.viagem),
    ExpenseModel(
        title: 'Cerveja do jogo',
        amount: 40.00,
        date: DateFormat('EEEE, dd/MM/yyyy').format(DateTime.now()),
        category: Category.alimentacao),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
      ),
      body: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          const Text('Gráfico de gastos'),
          SizedBox(
              height: 400,
              child: ExpensesListWidget(expenses: _registeredExpenses))
        ]),
      ),
    );
  }
}
