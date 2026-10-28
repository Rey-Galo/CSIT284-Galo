import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals2/data/dummy_data.dart';
import 'package:meals2/providers/filters_provider.dart';

final mealsProvider = Provider((ref) {
  // Return the list of meals or any other data you want to provide
  return dummyMeals;
});

final filteredMealsProvider = Provider((ref){
  final activeFilters = ref.watch(filtersProvider);
  final meals = ref.watch(mealsProvider);
  return meals.where((meal) {
      if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (activeFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
});