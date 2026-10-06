import 'package:flutter/material.dart';

import 'package:expense_tracker/currency_formatter.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/theme/app_theme.dart';

class SpendingSummary extends StatelessWidget {
  const SpendingSummary({super.key, required this.amount});

  final double amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 17, 20, 14),
      decoration: BoxDecoration(
        color: AppColors.teal,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'TOTAL SPENT THIS MONTH',
            style: TextStyle(
              color: AppColors.tealLight,
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.35,
            ),
          ),
          const SizedBox(height: 3),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    formatCurrency(amount),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.5,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF2A7063),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  '${Category.values.length} categories',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 7),
          Container(
            width: double.infinity,
            height: 1,
            color: const Color(0xFF2A7063),
          ),
          const SizedBox(height: 4),
          const Text(
            'Across your spending categories for this period.',
            style: TextStyle(color: AppColors.tealLight, fontSize: 10),
          ),
        ],
      ),
    );
  }
}
