extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1)}' : '';
}

extension Ex on double {
  double toPrecision(int n) => double.parse(toStringAsFixed(n));
}

extension DateHelpers on DateTime {
  bool isToday() {
    final now = DateTime.now();
    return now.day == day && now.month == month && now.year == year;
  }

  bool isSameDay(DateTime date) {
    return day == date.day && month == date.month && year == date.year;
  }
}
