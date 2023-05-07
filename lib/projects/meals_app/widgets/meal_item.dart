import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../model/meal.dart';
import 'meal_item_trait.dart';

class MealItem extends StatelessWidget {
  final Meal mealItem;
  final VoidCallback onSelectMeal;
  const MealItem({Key? key, required this.mealItem, required this.onSelectMeal}) : super(key: key);

  String get complexityText{
    return mealItem.complexity.name[0].toUpperCase() + mealItem.complexity.name.substring(1);
  }
  String get affordabilityText{
    return mealItem.affordability.name[0].toUpperCase() + mealItem.affordability.name.substring(1);
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: onSelectMeal,
        child: Stack(
          children: [
            Hero(
              tag: mealItem.id,
              child: FadeInImage(
                height: 200,
                width: double.infinity,
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(mealItem.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                color: Colors.black54,
                child: Column(
                  children: [
                    Text(
                      mealItem.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.white, // Theme.of(context).colorScheme.onTertiaryContainer,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Meal_Item_Trait(icon: Icons.schedule, label: '${mealItem.duration} min',),
                        Meal_Item_Trait(icon: Icons.work, label: complexityText,),
                        Meal_Item_Trait(icon: Icons.attach_money, label:affordabilityText,),
                      ],
                    )
                  ],
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
