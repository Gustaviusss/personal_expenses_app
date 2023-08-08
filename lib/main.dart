import 'package:flutter/material.dart';
import 'package:personal_expenses_app/expenses.dart';

void main() {
  runApp(
    MaterialApp(
        theme:
            ThemeData(appBarTheme: const AppBarTheme(color: Colors.deepPurple)),
        home: Expenses()),
  );
}
