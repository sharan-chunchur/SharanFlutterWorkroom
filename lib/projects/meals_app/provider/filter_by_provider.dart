import 'package:flutter_riverpod/flutter_riverpod.dart';


enum FilterBy{
  isGlutenFree,
  isVegan,
  isVegetarian,
  isLactoseFree,
}

class FilterNotifier extends StateNotifier<Map<FilterBy, bool>>{
  FilterNotifier() : super({
    FilterBy.isGlutenFree: false,
    FilterBy.isVegan: false,
    FilterBy.isVegetarian: false,
    FilterBy.isLactoseFree: false,
  });

  void setFilter(FilterBy filter, bool isActive){
    state = {
      ...state,
      filter: isActive,
    };
  }

}

final filterByProvider = StateNotifierProvider<FilterNotifier, Map<FilterBy, bool>>((ref){
  return FilterNotifier();
});
