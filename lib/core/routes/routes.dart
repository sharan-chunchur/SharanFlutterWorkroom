import 'package:flutter/material.dart';
import '../../projects/expense_tracker/expense_tracker.dart';
import '../../projects/groceries/groceries.dart';
import '../../projects/meals_app/meals_app.dart';
import '../../projects/tudoo/tudoo.dart';
import '../../projects/weather_inshort/weather_inshort.dart';
import '../models/project_model.dart';
import '../ui/screens/sharan_workroom_app.dart';

class ProjectRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/': (context) => const SharanWorkRoomApp(),
    ProjectModel.expenseTracker.route: (_) => const ExpenseTracker(),
    ProjectModel.weatherInshort.route: (_) => const WeatherInshort(),
    ProjectModel.tudoo.route: (_) => const TuDoo(),
    ProjectModel.mealApp.route: (_) => const MealApp(),
    ProjectModel.groceries.route: (_) => const Groceries(),
  };
}