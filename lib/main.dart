import 'package:flutter/material.dart';
import 'package:personal_expenses_app/expenses.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting('pt_BR', null).then((_) {
    runApp(
      MaterialApp(
        theme: ThemeData(useMaterial3: true),
        // ThemeData(appBarTheme: const AppBarTheme(color: Colors.deepPurple)),
        home: const Expenses(),
      ),
    );
  });
}
