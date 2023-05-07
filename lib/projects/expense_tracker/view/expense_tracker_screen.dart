import 'dart:ffi';

import 'package:flutter/material.dart';

import '../model/expense.dart';
import '../resources/constants.dart';
import '../widgets/chart/chart.dart';
import '../widgets/expenase_list/expense_list.dart';
import 'add_expense_view.dart';

class ExpenseReportScreen extends StatefulWidget {
  const ExpenseReportScreen({Key? key}) : super(key: key);

  @override
  State<ExpenseReportScreen> createState() => _ExpenseReportScreenState();
}

class _ExpenseReportScreenState extends State<ExpenseReportScreen> {

  final List<Expense> _registeredExpense = [
    Expense(
        title: 'Bus',
        amount: 19,
        date: DateTime.now(),
        category: Category.travel),
    Expense(
        title: 'Flutter Coarse',
        amount: 5.49,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'Cinema',
        amount: 14.99,
        date: DateTime.now(),
        category: Category.leisure)
  ];

  void _addExpenses(Expense exp) {
    setState(() {
      _registeredExpense.add(exp);
    });
  }

  void _removeExpenses(Expense exp) {
    final currentIndex = _registeredExpense.indexOf(exp);
    setState(() {
      _registeredExpense.remove(exp);
    });
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Removed'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(label : 'Undo', onPressed: (){
          setState(() {
            _registeredExpense.insert(currentIndex, exp);
          });
        }),
      ),
    );
  }

  void _bottomSheet() {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        )),
        context: context,
        builder: (ctx) {
          return SingleChildScrollView(
              child: AddExpenseView(addExpense: _addExpenses));
        });
  }

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    Widget chart = orientation == Orientation.portrait ? Chart(expenses: _registeredExpense) : Expanded(child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Chart(expenses: _registeredExpense),
    ));
    final List<Widget> homeWidgets = [
      // Chart(expenses: _registeredExpense),
      chart,
      _registeredExpense.isEmpty
          ? const Expanded(
        child: Center(
          child: Text('No Data Available'),
        ),
      )
          : Expanded(
          child: ExpenseList(
            expenseList: _registeredExpense,
            removeExpense: _removeExpenses,
          )),
    ];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(onPressed: _bottomSheet, icon: const Icon(Icons.add)),
        ],
      ),
      body: OrientationBuilder(builder: (BuildContext context, Orientation orientation){
        return orientation == Orientation.portrait ? Column(
          children: homeWidgets,
        ) : Row(
          children: homeWidgets,
        );
      },),
    );
  }
}
