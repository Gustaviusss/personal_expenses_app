import 'package:flutter/material.dart';
import 'package:personal_expenses_app/widgets/error_dialog_widget.dart';
import '../models/expense_model.dart';

class ModalExpenseForm extends StatefulWidget {
  const ModalExpenseForm({super.key, required this.addExpense});

  final void Function(ExpenseModel) addExpense;
  @override
  State<ModalExpenseForm> createState() => _ModalExpenseFormState();
}

class _ModalExpenseFormState extends State<ModalExpenseForm> {
  final _expenseTitleController = TextEditingController();
  final _expenseValueController = TextEditingController();
  Category _categoryController = Category.contas;
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

  void _submitData() {
    final enteredAmount = double.tryParse(_expenseValueController.text);
    final isAmountInvalid = enteredAmount == null || enteredAmount <= 0;
    if (_expenseTitleController.text.trim().isEmpty ||
        isAmountInvalid ||
        selectedDate == null) {
      showDialog(context: context, builder: (_) => const ErrorDialogWidget());
    } else {
      widget.addExpense(ExpenseModel(
          title: _expenseTitleController.text,
          amount: enteredAmount,
          date: selectedDate!,
          category: _categoryController));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 72, 24, 24),
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        const Padding(
          padding: EdgeInsets.all(20),
          child: Center(
              child: Text(
            "Novo Gasto",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          )),
        ),
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
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: DropdownButton(
                        hint: Text(_categoryController.name.toUpperCase()),
                        items: Category.values
                            .map((category) => DropdownMenuItem(
                                value: category,
                                child: Text(category.name.toUpperCase())))
                            .toList(),
                        onChanged: (value) {
                          if (value == null) {
                            return;
                          }
                          setState(() {
                            _categoryController = value;
                          });
                        }),
                  )
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
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(Icons.calendar_month)
                          ]),
                    )),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 2,
                  child: OutlinedButton(
                    onPressed: _submitData,
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
