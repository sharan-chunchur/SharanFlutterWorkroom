
import 'package:flutter/material.dart';

import '../../model/expense.dart';
import '../../resources/constants.dart';

class ExpenseItem extends StatelessWidget {
  final Expense expense;
  const ExpenseItem({Key? key, required this.expense}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Card(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(expense.title,style: Theme.of(context).textTheme.titleMedium,),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text('\$${expense.amount.toStringAsFixed(2)}',style: Theme.of(context).textTheme.bodyMedium,),
                  const Spacer(),
                  Row(
                    children: [
                      Icon(categoryIcons[expense.category],
                      ),
                      const SizedBox(
                        width: 8 ,
                      ),
                      Text(expense.formattedDate, style: Theme.of(context).textTheme.bodyMedium,),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
    );
  }
}
