import 'package:flutter/material.dart';

import '../model/meal.dart';
import '../widgets/meal_item.dart';
import 'meal_item_detail_screen.dart';

class MealsScreen extends StatefulWidget {
  final String? title;
  late List<Meal> meals;

  MealsScreen({Key? key, this.title, required this.meals})
      : super(key: key);

  @override
  State<MealsScreen> createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  void onSelectMeal(BuildContext context, Meal mealItem){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> MealItemDetailsScreen(mealItem: mealItem))).then((value) {
      // if(widget.title == null ){
      //   setState(() {
      //     widget.meals = favouriteMeal;
      //   });
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = widget.meals.isEmpty ? const Center(child: Text('No Meals Found!', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40),),)
        : ListView.builder(itemCount: widget.meals.length,
        itemBuilder: (context, index) {
          return MealItem(mealItem: widget.meals[index], onSelectMeal: (){
            onSelectMeal(context, widget.meals[index]);
          });
        });

    if(widget.title == null){
      return content;
    }
    return Scaffold(
      appBar: AppBar(title: Text(widget.title!),),
      body: content,
    );
  }
}
