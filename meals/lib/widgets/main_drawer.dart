import 'package:flutter/material.dart';
import 'package:meals/theme/midnight_kitchen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});

  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: MidnightKitchen.surface,
      surfaceTintColor: Colors.transparent,
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(color: MidnightKitchen.surface),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 48,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 18),
                Text(
                  'Cooking Up!',
                  style: Theme.of(context).textTheme.titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                ),
              ],
            ),
          ),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 8,
            ),
            leading: Icon(
              Icons.restaurant,
              size: 24,
              color: MidnightKitchen.foreground,
            ),
            title: Text(
              'Meals',
              style: Theme.of(context).textTheme.titleSmall!
                  .copyWith(color: MidnightKitchen.foreground, fontSize: 18),
            ),
            onTap: () {
              onSelectScreen('meals');
            },
          ),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 8,
            ),
            leading: Icon(
              Icons.settings,
              size: 24,
              color: MidnightKitchen.foreground,
            ),
            title: Text(
              'Filters',
              style: Theme.of(context).textTheme.titleSmall!
                  .copyWith(color: MidnightKitchen.foreground, fontSize: 18),
            ),
            onTap: () {
              onSelectScreen('filters');
            },
          ),
        ],
      ),
    );
  }
}
