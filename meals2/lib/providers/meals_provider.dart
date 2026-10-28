import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals2/data/dummy_data.dart';


final mealsProvider = Provider((ref) {
  // Return the list of meals or any other data you want to provide
  return dummyMeals;
});