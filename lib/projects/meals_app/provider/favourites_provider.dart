import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/meal.dart';

class FavouriteMealsNotifier extends StateNotifier<List<Meal>>{
  FavouriteMealsNotifier() : super([]);

  void toggleFavoruite(Meal meal){
    if(state.contains(meal)){
      state = state.where((stateMeal) => stateMeal.id != meal.id).toList();
    }else{
      state = [...state, meal];
    }
  }

  bool toggleFavIcon(Meal meal){
    if(state.contains(meal)){
      return true;
    }else{
      return false;
    }
  }
}

final favouritesMealsProvider = StateNotifierProvider<FavouriteMealsNotifier, List<Meal>>((ref){
  return FavouriteMealsNotifier();
});