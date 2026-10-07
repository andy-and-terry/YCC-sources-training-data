void main() {
  final d = DateTime.utc(2024, 2, 28, 12);
  print(d.add(const Duration(days: 2)));
  print(d.subtract(const Duration(hours: 13)));
  print(d.weekday == DateTime.wednesday);

  final later = DateTime.utc(2024, 12, 25);
  final diff = later.difference(d);
  print(diff.inDays);
  print(diff.inHours);

  const span = Duration(minutes: 135);
  print(span.inHours);
  print(span.inMinutes.remainder(60));
  print(span);

  print(d.toIso8601String());
  print(DateTime.parse('2024-03-15T10:20:30Z').millisecondsSinceEpoch);
  print(d.isBefore(later));
}
