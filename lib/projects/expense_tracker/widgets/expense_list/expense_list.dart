
import 'package:flutter/material.dart';

import '../../model/expense.dart';
import 'expense_item.dart';

class ExpenseList extends StatelessWidget {
  final List<Expense> expenseList;
  final Function removeExpense;

  const ExpenseList({
    super.key,
    required this.expenseList,
    required this.removeExpense,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenseList.length,
      itemBuilder: (context, index) {
        return Dismissible(
            key: ValueKey(
              expenseList[index],
            ),
            direction: DismissDirection.endToStart,
            background: Container(
              margin:  EdgeInsets.symmetric(vertical: 8.0, horizontal: Theme.of(context).cardTheme.margin!.horizontal),
              alignment: Alignment.centerRight,
              color: Theme.of(context).colorScheme.error,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.delete, size: 30, color: Theme.of(context).colorScheme.errorContainer),
              ),
            ),
            confirmDismiss: (_) async {
              await showDialog(
                context: context,
                builder: (ctx) {
                  return AlertDialog(
                    title:  Text('Delete!'),
                    content: const Text('Are you sure?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop(false);
                        },
                        child: Text('Cancel',  style: TextStyle(color: MediaQuery.of(context).platformBrightness == Brightness.dark ? Theme.of(context).colorScheme.primaryContainer : null),),
                      ),
                      TextButton(
                        onPressed: () {
                          removeExpense(expenseList[index]);
                          Navigator.of(ctx).pop(true);
                        },
                        child: Text('Delete',  style: TextStyle(color: MediaQuery.of(context).platformBrightness == Brightness.dark ? Theme.of(context).colorScheme.primaryContainer : null),),
                      ),
                    ],
                  );
                },
              );
              return null;
            },
            child: ExpenseItem(expense: expenseList[index]));
      },
    );
  }
}
