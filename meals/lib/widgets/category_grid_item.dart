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
          constraints: BoxConstraints(minHeight: highlighted ? 95 : 115),
          padding: const EdgeInsets.all(15),
          child: highlighted
              ? Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (displayNumber != null)
                            Text(
                              displayNumber.toString().padLeft(2, '0'),
                              style: Theme.of(context).textTheme.labelSmall!
                                  .copyWith(
                                    color: foreground,
                                    fontSize: 10,
                                    letterSpacing: 1,
                                  ),
                            ),
                          const SizedBox(height: 24),
                          Text(
                            category.title,
                            style: Theme.of(context).textTheme.titleMedium!
                                .copyWith(
                                  color: foreground,
                                  fontSize: 14,
                                  height: 1.3,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Icon(icon, size: 22, color: foreground),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        if (displayNumber != null)
                          Text(
                            displayNumber.toString().padLeft(2, '0'),
                            style: Theme.of(context).textTheme.labelSmall!
                                .copyWith(
                                  color: highlighted
                                      ? foreground
                                      : MidnightKitchen.muted,
                                  fontSize: 10,
                                  letterSpacing: 1,
                                ),
                          ),
                        const Spacer(),
                        Icon(
                          icon,
                          size: 22,
                          color: highlighted
                              ? foreground
                              : MidnightKitchen.amber,
                        ),
                      ],
                    ),
                    const SizedBox(height: 45),
                    Text(
                      category.title,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: foreground,
                        fontSize: 14,
                        height: 1.3,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
