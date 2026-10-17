import 'package:flutter/material.dart';

import 'package:meals/models/meal.dart';
import 'package:meals/screens/meal_details.dart';
import 'package:meals/widgets/meal_item.dart';
import 'package:meals/theme/midnight_kitchen.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
    required this.onToggleFavorite,
  });

  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFavorite;

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) =>
            MealDetailsScreen(meal: meal, onToggleFavorite: onToggleFavorite),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 720),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const ExcludeSemantics(
                child: Icon(
                  Icons.restaurant_menu,
                  size: 48,
                  color: MidnightKitchen.amber,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Uh oh ... nothing here!',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: MidnightKitchen.foreground,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Try selecting a different category!',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge!
                    .copyWith(color: MidnightKitchen.muted),
              ),
            ],
          ),
        ),
      ),
    );

    if (meals.isNotEmpty) {
      content = Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: ListView.separated(
            padding: const EdgeInsets.fromLTRB(20, 14, 20, 24),
            itemCount: meals.length + 1,
            separatorBuilder: (context, index) => const SizedBox(height: 18),
            itemBuilder: (ctx, index) {
              if (index == 0) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(4, 0, 4, 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title == null ? 'YOUR COLLECTION' : 'RECIPES',
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: MidnightKitchen.amber,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(height: 9),
                      Text(
                        title ?? 'Your Favorites',
                        style: Theme.of(context).textTheme.headlineLarge!
                            .copyWith(
                              fontSize: 32,
                              fontWeight: FontWeight.w800,
                              height: 1.12,
                              letterSpacing: -1.2,
                            ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        title == null
                            ? 'The meals you keep coming back to.'
                            : '${meals.length} ${meals.length == 1 ? 'recipe' : 'recipes'} to make your own.',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: MidnightKitchen.muted,
                          fontSize: 13,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                );
              }
              return MealItem(
                meal: meals[index - 1],
                onSelectMeal: (meal) {
                  selectMeal(context, meal);
                },
              );
            },
          ),
        ),
      );
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.soup_kitchen_outlined,
              color: MidnightKitchen.amber,
              size: 22,
            ),
          ),
        ],
      ),
      body: content,
    );
  }
}
