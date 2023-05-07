import '../resources/constants.dart';

class Expense{
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  Expense({required this.title, required this.amount, required this.date, required this.category}) : id = kUuid.v4();

  String get formattedDate{
    return kFormatter.format(date);
  }
}