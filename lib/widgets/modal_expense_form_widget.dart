import 'package:flutter/material.dart';
import '../models/expense_model.dart';

class ModalExpenseForm extends StatefulWidget {
  const ModalExpenseForm({super.key});

  @override
  State<ModalExpenseForm> createState() => _ModalExpenseFormState();
}

class _ModalExpenseFormState extends State<ModalExpenseForm> {
  var _expenseTitle = '';

  void _savedExpenseTitle(String inputValue) {
    _expenseTitle = inputValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        const Center(child: Text("Novo Gasto")),
        SizedBox(
          height: 400,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextField(
                  onSubmitted: _savedExpenseTitle,
                  decoration: const InputDecoration(
                      label: Text('Título'), border: OutlineInputBorder()),
                  keyboardType: TextInputType.text,
                ),
                const TextField(
                  decoration: InputDecoration(
                      label: Text('Valor'), border: OutlineInputBorder()),
                  keyboardType: TextInputType.number,
                ),
                const DropdownMenu(
                    label: Text('Categoria'),
                    dropdownMenuEntries: [
                      DropdownMenuEntry(
                        value: Category.alimentacao,
                        label: 'Alimentação',
                      ),
                      DropdownMenuEntry(
                        value: Category.contas,
                        label: 'Contas',
                      ),
                      DropdownMenuEntry(
                        value: Category.lazer,
                        label: 'Lazer',
                      ),
                      DropdownMenuEntry(
                        value: Category.viagem,
                        label: 'Viagem',
                      ),
                    ])
              ]),
        )
      ]),
    );
  }
}
