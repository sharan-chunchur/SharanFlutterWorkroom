
import 'package:flutter/material.dart';
import '../../model/expense.dart';
import '../../resources/constants.dart';
import '../expense_bucket.dart';
import 'chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Expense> expenses;
  const Chart({Key? key, required this.expenses}) : super(key: key);

  List<ExpenseBucket> get buckets{
    return [
      ExpenseBucket.forCategory(expenses, Category.food),
      ExpenseBucket.forCategory(expenses, Category.travel),
      ExpenseBucket.forCategory(expenses, Category.leisure),
      ExpenseBucket.forCategory(expenses, Category.work),
    ];
  }

  double get maxTotalExpense{
    double maxTotalExpense = 0 ;
    for(final bucket in buckets){
      if(bucket.totalExpense > maxTotalExpense){
        maxTotalExpense = bucket.totalExpense;
      }
    }
    return maxTotalExpense;
  }

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 8,
      ),
      width: double.infinity,
      height: orientation == Orientation.portrait ? 180 : MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.3),
            Theme.of(context).colorScheme.primary.withOpacity(0.0)
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Row(
        children: buckets.map((bucket) {
          return ChartBar( category: bucket.category, heightRatio:maxTotalExpense==0 ? 0 :  orientation == Orientation.portrait ? bucket.totalExpense * 100 /maxTotalExpense : bucket.totalExpense * 150 /maxTotalExpense);
        }).toList()
      ),
    );
  }
}
