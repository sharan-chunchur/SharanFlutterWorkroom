import 'package:flutter/material.dart';
import 'package:sharan_workroom/projects/tudoo/screens/tasks_screen.dart';
import 'package:provider/provider.dart';
import 'models/task_data.dart';

void main() => runApp(TuDoo());

class TuDoo extends StatelessWidget {
  const TuDoo({super.key});

  @override
  Widget build(BuildContext context) {
    return
      ChangeNotifierProvider(
      create: (context) => TaskData(),
      child:
      MaterialApp(
          debugShowCheckedModeBanner: false,
        home: TasksScreen(),
      ),
    );
  }
}