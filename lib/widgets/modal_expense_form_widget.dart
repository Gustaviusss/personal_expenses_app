import 'package:flutter/material.dart';
import '../models/expense_model.dart';

class ModalExpenseForm extends StatefulWidget {
  const ModalExpenseForm({super.key});

  @override
  State<ModalExpenseForm> createState() => _ModalExpenseFormState();
}

class _ModalExpenseFormState extends State<ModalExpenseForm> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(24),
      child: Column(children: [
        Center(child: Text("Novo Gasto")),
        SizedBox(
          height: 400,
          child: Column(children: [
            TextField(
              keyboardType: TextInputType.text,
            ),
            TextField(
              keyboardType: TextInputType.number,
            ),
            DropdownMenu(dropdownMenuEntries: [
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
