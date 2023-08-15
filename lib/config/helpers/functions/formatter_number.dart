import 'package:intl/intl.dart';

class FormatterNumberHuman { 
  static String number(double number) => NumberFormat.compactCurrency(
    decimalDigits: 0,symbol: ''
  ).format(number);
}