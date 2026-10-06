import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expense_tracker/theme/app_theme.dart';

class MonthPicker extends StatelessWidget {
  const MonthPicker({
    super.key,
    required this.selectedMonth,
    required this.availableMonths,
    required this.onMonthSelected,
  });

  final DateTime selectedMonth;
  final List<DateTime> availableMonths;
  final ValueChanged<DateTime> onMonthSelected;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: PopupMenuButton<DateTime>(
        tooltip: 'Choose a month',
        onSelected: (month) {
          onMonthSelected(month);
        },
        itemBuilder: (context) => [
          for (final month in availableMonths)
            PopupMenuItem(
              value: month,
              child: Text(DateFormat('MMMM yyyy').format(month)),
            ),
        ],
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(DateFormat('MMMM yyyy').format(selectedMonth)),
              const Icon(Icons.expand_more_rounded),
            ],
          ),
        ),
      ),
    );
  }
}
