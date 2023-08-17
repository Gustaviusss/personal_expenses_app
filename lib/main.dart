import 'package:flutter/material.dart';
import 'package:personal_expenses_app/expenses.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  initializeDateFormatting('pt_BR', null).then((_) {
    runApp(
      MaterialApp(
        localizationsDelegates: const <LocalizationsDelegate<Object>>[
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const <Locale>[
          Locale('en', 'US'), // English
          Locale('pt', 'BR'), // Hebrew
          // ... other locales the app supports
        ],
        theme: ThemeData(useMaterial3: true),
        // ThemeData(appBarTheme: const AppBarTheme(color: Colors.deepPurple)),
        home: const Expenses(),
      ),
    );
  });
}
