import 'package:flutter/material.dart';

class ChartbarContainer extends StatelessWidget {
  final double height;
  const ChartbarContainer({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: height,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius:
            const BorderRadius.vertical(top: Radius.circular(8)),
            color: isDarkMode
                ? Theme.of(context).colorScheme.secondary
                : Theme.of(context).colorScheme.primary.withOpacity(0.65),
          ),
      ),
    );
  }
}
