import 'package:intl/intl.dart';

abstract class DateHelpers {
  DateHelpers._();

  static List<String> getDaysInBetween(DateTime startDate, DateTime endDate) {
    final DateFormat formatter = DateFormat('dd.MM.yyyy');
    final List<String> days = [];

    for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
      final day = startDate.add(Duration(days: i));
      days.add(formatter.format(day));
    }
    return days;
  }
}
