import 'package:flutter/material.dart';
import '../model/category.dart';
import '../model/meal.dart';
import '../provider/filter_by_provider.dart';
import '../widgets/category_grid_item.dart';
import 'meals_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/available_meals_provider.dart';

class CategoriesScreen extends ConsumerStatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends ConsumerState<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 300),
        lowerBound: 0,
        upperBound: 1);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void selectMeals(BuildContext context, Category category, List<Meal> meals,
      Map<FilterBy, bool> activeFilters) {
    final categoryMeals =
    meals.where((meal) => meal.categories.contains(category.id)).toList();
    final filteredMeals = categoryMeals.where((meal) {
      if (activeFilters[FilterBy.isGlutenFree]! && !meal.isGlutenFree) {
        return false;
      } else if (activeFilters[FilterBy.isLactoseFree]! &&
          !meal.isLactoseFree) {
        return false;
      } else if (activeFilters[FilterBy.isVegan]! && !meal.isVegan) {
        return false;
      } else if (activeFilters[FilterBy.isVegetarian]! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            MealsScreen(
              title: category.title,
              meals: filteredMeals,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final availableCategories = ref.watch(categoryProvider);
    final meals = ref.watch(mealsProvider);
    final activeFilters = ref.watch(filterByProvider);
    return AnimatedBuilder(
      animation: _animationController,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 3 / 2),
          itemCount: availableCategories.length,
          itemBuilder: (context, index) {
            return CategoryGridItem(
              categoryItem: availableCategories[index],
              selectMeals: () {
                selectMeals(
                    context, availableCategories[index], meals,
                    activeFilters);
              },
            );
          }),
      builder: (context, child) =>
          SlideTransition(
            position: Tween(begin: const Offset(0, 0.3), end: const Offset(0, 0)).animate(
              CurvedAnimation(
                  parent: _animationController, curve: Curves.linear),), child: child,)
    );
  }
}
