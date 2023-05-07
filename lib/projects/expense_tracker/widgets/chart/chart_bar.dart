
import 'package:flutter/material.dart';

import '../../model/expense.dart';
import '../../resources/constants.dart';
import 'chart_bar_container.dart';

class ChartBar extends StatelessWidget {
  final Category category;
  final double heightRatio;

  const ChartBar(
      {Key? key, required this.category, required this.heightRatio})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ChartbarContainer(height: heightRatio,),
          Icon(categoryIcons[category], color: isDarkMode
              ? Theme.of(context).colorScheme.secondary
              : Theme.of(context)
              .colorScheme
              .primary
              .withOpacity(0.7),),
        ],
      ),
    );
  }
}
