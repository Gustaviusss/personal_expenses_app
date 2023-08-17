import 'package:flutter/material.dart';
import '../models/expense_model.dart';

class ModalExpenseForm extends StatefulWidget {
  const ModalExpenseForm({super.key});

  @override
  State<ModalExpenseForm> createState() => _ModalExpenseFormState();
}

class _ModalExpenseFormState extends State<ModalExpenseForm> {
  final _expenseTitleController = TextEditingController();
  final _expenseValueController = TextEditingController();
  DateTime? selectedDate;

  @override
  void dispose() {
    _expenseTitleController.dispose();
    _expenseValueController.dispose();
    super.dispose();
  }

  void _presentDatePicker() {
    final today = DateTime.now();
    final firstDay = DateTime(today.year, today.month - 1, today.day);
    showDatePicker(
            locale: const Locale('pt', 'BR'),
            context: context,
            initialDate: today,
            firstDate: firstDay,
            lastDate: today)
        .then((value) {
      setState(() {
        selectedDate = value;
      });
    });
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
                    child: TextField(
                      controller: _expenseValueController,
                      decoration: const InputDecoration(
                          prefixText: 'R\$ ',
                          label: Text('Valor'),
                          border: OutlineInputBorder()),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                    flex: 2,
                    child: OutlinedButton(
                      onPressed: _presentDatePicker,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(selectedDate == null
                                ? "Data"
                                : '${selectedDate?.day}/${selectedDate?.month}/${selectedDate?.year}'),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.calendar_month)
                          ]),
                    )),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 2,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text(
                      'Salvar Gasto',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Cancelar',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.deepPurple,
                    ),
                  ),
                ),
              ],
            ),
          ]),
        )
      ]),
    );
  }
}
