import 'package:flutter/material.dart';

import 'package:expense_tracker/currency_formatter.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/theme/app_theme.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expenses});

  final List<Expense> expenses;

  List<ExpenseBucket> get buckets => [
    for (final category in Category.values)
      ExpenseBucket.forCategory(expenses, category),
  ];

  double get maxTotalExpense {
    var max = 0.0;
    for (final bucket in buckets) {
      if (bucket.totalExpenses > max) max = bucket.totalExpenses;
    }
    return max;
  }

  String _amountLabel(double amount) => formatCompactCurrency(amount);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 11),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          for (final bucket in buckets)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 7),
              child: _CategoryBar(
                category: bucket.category,
                amount: bucket.totalExpenses,
                maxAmount: maxTotalExpense,
                amountLabel: _amountLabel(bucket.totalExpenses),
              ),
            ),
        ],
      ),
    );
  }
}

class _CategoryBar extends StatelessWidget {
  const _CategoryBar({
    required this.category,
    required this.amount,
    required this.maxAmount,
    required this.amountLabel,
  });

  final Category category;
  final double amount;
  final double maxAmount;
  final String amountLabel;

  @override
  Widget build(BuildContext context) {
    final color = AppColors.category(category);
    return Row(
      children: [
        Container(
          width: 9,
          height: 9,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: 64,
          child: Text(
            category.name[0].toUpperCase() + category.name.substring(1),
            style: const TextStyle(
              color: AppColors.ink,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: maxAmount == 0
                  ? 0
                  : (amount / maxAmount).clamp(0, 1).toDouble(),
              minHeight: 7,
              backgroundColor: AppColors.track,
              valueColor: AlwaysStoppedAnimation(color),
            ),
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: 52,
          child: Text(
            amountLabel,
            textAlign: TextAlign.right,
            style: const TextStyle(
              color: AppColors.ink,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
