import 'package:intl/intl.dart';

String formatCurrency(num amount, {int decimalDigits = 2}) {
  return NumberFormat.currency(
    locale: 'en_PH',
    name: 'PHP',
    symbol: '₱',
    decimalDigits: decimalDigits,
  ).format(amount);
}

String formatCompactCurrency(num amount) {
  final decimalDigits = amount == amount.roundToDouble() ? 0 : 2;
  return formatCurrency(amount, decimalDigits: decimalDigits);
}
