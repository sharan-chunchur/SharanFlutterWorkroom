import 'package:flutter/material.dart';
import '../model/category.dart';

class CategoryGridItem extends StatelessWidget {
  final Category categoryItem;
  final VoidCallback selectMeals;

  const CategoryGridItem({Key? key, required this.categoryItem, required this.selectMeals})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectMeals,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              categoryItem.color.withOpacity(0.55),
              categoryItem.color.withOpacity(0.9)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          categoryItem.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.background
          ),
        ),
      ),
    );
  }
}
