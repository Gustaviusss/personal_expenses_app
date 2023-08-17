import 'package:flutter/material.dart';
import '../models/expense_model.dart';

class ModalExpenseForm extends StatefulWidget {
  const ModalExpenseForm({super.key});

  @override
  State<ModalExpenseForm> createState() => _ModalExpenseFormState();
}

class _ModalExpenseFormState extends State<ModalExpenseForm> {
  var _expenseTitleController = TextEditingController();

  @override
  void dispose() {
    _expenseTitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        const Center(child: Text("Novo Gasto")),
        SizedBox(
          height: 400,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            TextField(
              controller: _expenseTitleController,
              decoration: const InputDecoration(
                  label: Text('Título'), border: OutlineInputBorder()),
              keyboardType: TextInputType.text,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 60,
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: const TextField(
                      decoration: InputDecoration(
                          label: Text('Valor'), border: OutlineInputBorder()),
                      keyboardType: TextInputType.number,
                    ),
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
                      ]),
                ],
              ),
            ),
            OutlinedButton(
              onPressed: () {},
              child: Text('Salvar Gasto'),
            )
          ]),
        )
      ]),
    );
  }
}
