
import 'package:flutter/material.dart';
import 'package:sharan_workroom/projects/expense_tracker/resources/constants.dart';
import 'view/expense_tracker_screen.dart';


class ExpenseTracker extends StatelessWidget {
  const ExpenseTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      darkTheme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorSchemeDark,
        scaffoldBackgroundColor: kColorSchemeDark.background,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorSchemeDark.onPrimary,
          foregroundColor: kColorSchemeDark.onPrimaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorSchemeDark.secondary,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorSchemeDark.primaryContainer,
            foregroundColor: kColorSchemeDark.onPrimaryContainer,
          ),
        ),
        iconTheme:const IconThemeData().copyWith(
          color: kColorSchemeDark.onSecondary
        ), //ThemeData.dark().iconTheme,
        hintColor: kColorSchemeDark.onSecondaryContainer,
        textTheme: ThemeData().textTheme.copyWith(
          titleMedium: TextStyle(
              color: kColorSchemeDark.onSecondary,
              fontSize: 20,
              fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(
            color: kColorSchemeDark.onSecondary,
            fontSize: 16,
          ),
        ),
        dropdownMenuTheme: DropdownMenuThemeData().copyWith(
          textStyle: TextStyle(color:Colors.redAccent),
        ),
        inputDecorationTheme: InputDecorationTheme().copyWith(
          prefixStyle: TextStyle(color: kColorSchemeDark.onSecondaryContainer),
          hintStyle: TextStyle(color: kColorSchemeDark.onSecondaryContainer, fontSize: 10),
        ),
        dialogTheme: DialogTheme().copyWith(
          backgroundColor: kColorSchemeDark.secondary,
        ),
      ),
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        ),
        iconTheme:const IconThemeData().copyWith(
            color: kColorScheme.onSecondaryContainer
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
            foregroundColor: kColorScheme.onPrimaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleMedium: TextStyle(
                  color: kColorScheme.onSecondaryContainer,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              bodyMedium: TextStyle(
                color: kColorScheme.onSecondaryContainer,
                fontSize: 16,
              ),
            ),
      ),
      home: ExpenseReportScreen(),
    );
  }
}
