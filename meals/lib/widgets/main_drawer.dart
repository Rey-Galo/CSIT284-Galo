import 'package:flutter/material.dart';
import 'package:meals/theme/midnight_kitchen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});

  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: MidnightKitchen.background,
      surfaceTintColor: Colors.transparent,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 28, 12, 36),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.soup_kitchen_outlined,
                      size: 22,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Cooking Up!',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: MidnightKitchen.foreground,
                        fontSize: 31,
                        height: 1.12,
                        letterSpacing: -1.1,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),
              const SizedBox(height: 20),
              ListTile(
                tileColor: MidnightKitchen.soft,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 4,
                ),
                leading: Icon(
                  Icons.restaurant_outlined,
                  size: 22,
                  color: MidnightKitchen.amber,
                ),
                title: Text(
                  'Meals',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: MidnightKitchen.amber,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onTap: () {
                  onSelectScreen('meals');
                },
              ),
              const SizedBox(height: 6),
              ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 4,
                ),
                leading: Icon(
                  Icons.tune,
                  size: 22,
                  color: MidnightKitchen.foreground,
                ),
                title: Text(
                  'Filters',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: MidnightKitchen.foreground,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onTap: () {
                  onSelectScreen('filters');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
