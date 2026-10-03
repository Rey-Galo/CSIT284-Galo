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
      date: DateTime(
        int.parse(DateFormat('yyyy').format(DateTime.now())),
        9,
        15,
      ),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime(
        int.parse(DateFormat('yyyy').format(DateTime.now())),
        9,
        25,
      ),
      category: Category.leisure,
    ),
    Expense(
      title: 'Groceries',
      amount: 45.23,
      date: DateTime(
        int.parse(DateFormat('yyyy').format(DateTime.now())),
        10,
        1,
      ),
      category: Category.food,
    ),
    Expense(
      title: 'New Shoes',
      amount: 89.99,
      date: DateTime(
        int.parse(DateFormat('yyyy').format(DateTime.now())),
        10,
        2,
      ),
      category: Category.leisure,
    ),
    Expense(
      title: 'Flight to Siargao',
      amount: 299.99,
      date: DateTime(
        int.parse(DateFormat('yyyy').format(DateTime.now())),
        9,
        20,
      ),
      category: Category.travel,
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
    final months = [
      DateTime(DateTime.now().year, DateTime.now().month),
      DateTime(DateTime.now().year, DateTime.now().month - 1),
    ];
    for (final expense in _registeredExpenses) {
      months.add(DateTime(expense.date.year, expense.date.month));
    }
    final uniqueMonths = months.toSet().toList();
    uniqueMonths.sort((a, b) => b.compareTo(a));
    return uniqueMonths;
  }

  Future<void> _openAddExpenseOverlay() async {
    await Navigator.of(context).push<void>(
      MaterialPageRoute(
        builder: (ctx) => NewExpense(onAddExpense: _addExpense),
      ),
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
    final amount = _selectedMonthTotal;
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

  Widget _buildHeader() {
    return Row(
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome back!',
                style: TextStyle(
                  color: AppColors.muted,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Expense Tracker',
                style: TextStyle(
                  color: AppColors.ink,
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final monthExpenses = _selectedMonthExpenses;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  _buildHeader(),
                  const SizedBox(height: 20),
                  _buildMonthPicker(),
                  const SizedBox(height: 18),
                  _buildSpendingSummary(),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Spending by category',
                        style: TextStyle(
                          color: AppColors.ink,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'This month',
                        style: const TextStyle(
                          color: AppColors.muted,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
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
            SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
                child: SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: FilledButton.icon(
                    onPressed: _openAddExpenseOverlay,
                    icon: const Icon(Icons.add_rounded),
                    label: const Text('Add expense'),
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.teal,
                      foregroundColor: Colors.white,
                      textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
