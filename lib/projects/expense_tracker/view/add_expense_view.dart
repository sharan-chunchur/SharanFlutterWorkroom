
import 'package:flutter/material.dart';

import '../model/expense.dart';
import '../resources/constants.dart';

class AddExpenseView extends StatefulWidget {
  final Function addExpense;

  const AddExpenseView({Key? key, required this.addExpense}) : super(key: key);

  @override
  State<AddExpenseView> createState() => _AddExpenseViewState();
}

class _AddExpenseViewState extends State<AddExpenseView> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category? _selectedCategory;

  void _dateSelector() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
      builder: MediaQuery.of(context).platformBrightness == Brightness.dark
          ? (context, child) {
              return Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: kColorSchemeDark.copyWith(
                    error: Colors.redAccent.shade700,
                    brightness: Brightness.light,
                    onSurface: Colors.black,
                    // rest all dates colors
                    primary: Colors.blue.shade900,
                    // choosen date background color and top container background color
                    onPrimary: Colors
                        .white, // choosen date color and top container text color
                  ),
                  textButtonTheme: TextButtonThemeData(
                    style: TextButton.styleFrom(
                      foregroundColor: Theme.of(context)
                          .primaryColorDark, // button text color
                    ),
                  ),
                ),
                child: child!,
              );
            }
          : null,
    );
    setState(() {
      if (pickedDate != null) {
        _selectedDate = pickedDate;
      }
    });
  }

  void _submitNewExpenseDetails() {
    final enteredAmount = double.tryParse(_amountController.text);
    final isInvalidAmount = enteredAmount == null || enteredAmount <= 0;
    if (_titleController.text.trim().isEmpty ||
        isInvalidAmount ||
        _selectedDate == null ||
        _selectedCategory == null) {
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const Text('Invalid Data!'),
            content: const Text('Please check entered data'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: Text(
                  'Okay',
                  style: TextStyle(color: Theme.of(context).primaryColorDark),
                ),
              ),
            ],
          );
        },
      );
      return;
    }
    final expense = Expense(
        title: _titleController.text,
        amount: enteredAmount,
        date: _selectedDate!,
        category: _selectedCategory!);
    widget.addExpense(expense);
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _amountController.dispose();
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Padding(
      padding: EdgeInsets.fromLTRB(
          20, 20, 20, 20 + MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        children: [
          TextField(
            style: TextStyle(
                color: isDarkMode
                    ? Theme.of(context).colorScheme.onSecondaryContainer
                    : null),
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(label: Text('Title')),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  style: TextStyle(
                      color: isDarkMode
                          ? Theme.of(context).colorScheme.onSecondaryContainer
                          : null),
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      label: Text('Amount'), prefixText: '\$ '),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      _selectedDate != null
                          ? kFormatter.format(_selectedDate!).toString()
                          : 'Select Date',
                      style:  _selectedDate == null || isDarkMode ? TextStyle(
                          color: Theme.of(context).hintColor,
                          fontSize: 14,
                          fontWeight: FontWeight.normal) : null,
                    ),
                    IconButton(
                      onPressed: _dateSelector,
                      icon: Icon(
                        Icons.date_range,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Expanded(
                child: DropdownButton(
                  dropdownColor: isDarkMode ? Theme.of(context).colorScheme.onSecondary : Theme.of(context).colorScheme.primaryContainer,
                    alignment: Alignment.centerLeft,
                    style: TextStyle(
                      color: isDarkMode
                          ? Theme.of(context).colorScheme.onSecondaryContainer
                          : null,
                    ),
                    isExpanded: true,
                    hint: const Text(
                      'Category',
                    ),
                    value: _selectedCategory,
                    items: Category.values
                        .map(
                          (category) => DropdownMenuItem(
                            value: category,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 8),
                              child: Text(
                                category.name.toUpperCase(),
                                textAlign: TextAlign.left,
                                style: TextStyle(color: Theme.of(context).colorScheme.onSecondaryContainer),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedCategory = value;
                      });
                    }),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    ElevatedButton(
                        onPressed: _submitNewExpenseDetails,
                        child: const Text('Save')),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
