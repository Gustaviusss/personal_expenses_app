import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();

enum Category { alimentacao, viagem, lazer, contas }

const categoryIcons = {
  Category.alimentacao: Icons.dining_rounded,
  Category.contas: Icons.receipt_long_rounded,
  Category.lazer: Icons.movie_creation_rounded,
  Category.viagem: Icons.flight
};

class ExpenseModel {
  ExpenseModel(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return DateFormat('EEEE, dd/MM/yyyy', 'pt_BR').format(date);
  }
}
