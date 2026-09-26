import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'package:expense_tracker/currency_formatter.dart';
import 'package:expense_tracker/theme/app_theme.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/chart/chart.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  DateTime _selectedMonth = DateTime(DateTime.now().year, DateTime.now().month);

  List<Expense> get _selectedMonthExpenses {
    final expenses = _registeredExpenses.where((expense) {
      return expense.date.year == _selectedMonth.year &&
          expense.date.month == _selectedMonth.month;
    }).toList();
    expenses.sort((a, b) => b.date.compareTo(a.date));
    return expenses;
  }

  double get _selectedMonthTotal => _selectedMonthExpenses.fold(
    0.0,
    (total, expense) => total + expense.amount,
  );

  List<DateTime> get _availableMonths {
    final months = <DateTime>{_selectedMonth};
    for (final expense in _registeredExpenses) {
      months.add(DateTime(expense.date.year, expense.date.month));
    }
    return months.toList()..sort((a, b) => b.compareTo(a));
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
      _selectedMonth = DateTime(expense.date.year, expense.date.month);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense deleted.'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  Widget _buildMonthPicker() {
    return Align(
      alignment: Alignment.centerLeft,
      child: PopupMenuButton<DateTime>(
        tooltip: 'Choose a month',
        onSelected: (month) => setState(() => _selectedMonth = month),
        itemBuilder: (context) => [
          for (final month in _availableMonths)
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
              Text(DateFormat('MMMM yyyy').format(_selectedMonth)),
              const Icon(Icons.expand_more_rounded),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSpendingSummary() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.teal,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'TOTAL SPENT THIS MONTH',
            style: TextStyle(color: AppColors.tealLight, fontSize: 11),
          ),
          const SizedBox(height: 8),
          Text(
            formatCurrency(_selectedMonthTotal),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final monthExpenses = _selectedMonthExpenses;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter ExpenseTracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            _buildMonthPicker(),
            const SizedBox(height: 18),
            _buildSpendingSummary(),
            const SizedBox(height: 20),
            Chart(expenses: monthExpenses),
            const SizedBox(height: 20),
            const Text(
              'Recent expenses',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            if (monthExpenses.isEmpty)
              const Text('No expenses this month.')
            else
              ExpensesList(
                expenses: monthExpenses,
                onRemoveExpense: _removeExpense,
              ),
          ],
        ),
      ),
    );
  }
}
