import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category { alimentacao, viagem, lazer, contas }

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
  final String date;
  final Category category;
}
