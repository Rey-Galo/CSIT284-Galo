import 'package:flutter/material.dart';
import 'package:meals/theme/midnight_kitchen.dart';
import 'package:meals/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    super.key,
    required this.category,
    required this.onSelectCategory,
    this.displayNumber,
    this.icon = Icons.restaurant_outlined,
    this.highlighted = false,
  });

  final Category category;
  final void Function() onSelectCategory;
  final int? displayNumber;
  final IconData icon;
  final bool highlighted;

  @override
  Widget build(BuildContext context) {
    final foreground = highlighted
        ? MidnightKitchen.onAmber
        : MidnightKitchen.foreground;

    return Material(
      color: highlighted ? MidnightKitchen.amber : MidnightKitchen.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: highlighted ? MidnightKitchen.amber : MidnightKitchen.border,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onSelectCategory,
        child: Container(
          constraints: const BoxConstraints(minHeight: 115),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  if (displayNumber != null)
                    Text(
                      displayNumber.toString().padLeft(2, '0'),
                      style: Theme.of(context).textTheme.labelSmall!
                          .copyWith(color: foreground, fontSize: 12),
                    ),
                  const Spacer(),
                  Icon(icon, size: 24, color: foreground),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                category.title,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: foreground,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
