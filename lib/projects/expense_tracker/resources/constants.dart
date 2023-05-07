import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import 'package:flutter/material.dart';

final ColorScheme kColorScheme =  ColorScheme.fromSeed(seedColor: const Color.fromARGB(
    255, 111, 30, 255),);

final ColorScheme kColorSchemeDark =  ColorScheme.fromSeed(seedColor: const Color.fromARGB(
    255, 5, 242, 255), brightness: Brightness.dark);


final kFormatter =  DateFormat('dd-MM-yyyy');

const kUuid = Uuid();

final categoryIcons ={
  Category.food : Icons.lunch_dining,
  Category.travel : Icons.flight_takeoff,
  Category.leisure : Icons.movie,
  Category.work : Icons.work,
};

enum Category{
  food,
  travel,
  leisure,
  work,
}

