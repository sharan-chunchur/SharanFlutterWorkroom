import 'package:flutter/material.dart';

import '../model/meal.dart';
import '../widgets/fav_iconbutton.dart';

class MealItemDetailsScreen extends StatelessWidget {
  final Meal mealItem;

  const MealItemDetailsScreen({Key? key, required this.mealItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mealItem.title),
        actions: [
          FavIconButton(mealItem: mealItem),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Hero(
              tag: mealItem.id,
              child: Container(
                // width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.width * 2 / 4,
                child: Image.network(
                  mealItem.imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  // Theme.of(context).colorScheme.onTertiaryContainer,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            for (final ing in mealItem.ingredients)
              Text(
                ing,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    // Theme.of(context).colorScheme.onTertiaryContainer,
                    fontWeight: FontWeight.bold),
              ),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  // Theme.of(context).colorScheme.onTertiaryContainer,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            for (final step in mealItem.steps)
              Text(
                step,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    // Theme.of(context).colorScheme.onTertiaryContainer,
                    fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}
