import 'package:flutter/material.dart';

import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/category_grid_item.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/models/category.dart';
import 'package:meals/theme/midnight_kitchen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
    required this.onToggleFavorite,
    required this.availableMeals,
  });

  final void Function(Meal meal) onToggleFavorite;
  final List<Meal> availableMeals;

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
          onToggleFavorite: onToggleFavorite,
        ),
      ),
    ); // Navigator.push(context, route)
  }

  static const _categoryIcons = <String, IconData>{
    'c1': Icons.restaurant,
    'c2': Icons.timer_outlined,
    'c3': Icons.lunch_dining_outlined,
    'c4': Icons.restaurant_menu,
    'c5': Icons.eco_outlined,
    'c6': Icons.local_fire_department_outlined,
    'c7': Icons.egg_outlined,
    'c8': Icons.ramen_dining_outlined,
    'c9': Icons.bakery_dining_outlined,
    'c10': Icons.wb_sunny_outlined,
  };

  Widget _buildCategoryTile(BuildContext context, int index) {
    final category = availableCategories[index];

    return CategoryGridItem(
      category: category,
      displayNumber: index + 1,
      icon: _categoryIcons[category.id] ?? Icons.restaurant_outlined,
      highlighted: index == 0,
      onSelectCategory: () {
        _selectCategory(context, category);
      },
    );
  }

  Widget _buildHeader(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'YOUR NEXT GOOD MEAL',
          style: textTheme.labelSmall!.copyWith(
            color: MidnightKitchen.amber,
            fontSize: 12,
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Find your next favorite.',
          style: textTheme.headlineLarge!.copyWith(
            color: MidnightKitchen.foreground,
            fontSize: 32,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Explore a category. Find something delicious.',
          style: textTheme.bodyMedium!.copyWith(
            color: MidnightKitchen.muted,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 12,
          runSpacing: 8,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(
              'Categories',
              style: textTheme.titleMedium!.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              '${availableCategories.length} collections',
              style: textTheme.bodyMedium!.copyWith(
                color: MidnightKitchen.muted,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.all(24),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    _buildHeader(context),
                    _buildCategoryTile(context, 0),
                    const SizedBox(height: 12),
                    for (
                      var index = 1;
                      index < availableCategories.length;
                      index += 2
                    )
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: _buildCategoryTile(context, index)),
                            const SizedBox(width: 12),
                            Expanded(
                              child: index + 1 < availableCategories.length
                                  ? _buildCategoryTile(context, index + 1)
                                  : const SizedBox.shrink(),
                            ),
                          ],
                        ),
                      ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
