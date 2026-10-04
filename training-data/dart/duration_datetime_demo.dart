void main() {
  final start = DateTime.utc(2024, 2, 27, 8, 30);
  final later = start.add(const Duration(days: 2, hours: 5));

  print(later.toIso8601String());
  print(later.weekday);
  print(later.month);
  print(later.difference(start));
  print(later.difference(start).inHours);
  print(start.isBefore(later));

  const d = Duration(minutes: 135, seconds: 7);
  print(d);
  print('${d.inHours}h ${d.inMinutes.remainder(60)}m');
  print(d * 2);

  final parsed = DateTime.parse('2023-12-31T23:59:59Z');
  print(parsed.add(const Duration(seconds: 1)));
  print(DateTime(2024, 3, 0).day);
  print(start.millisecondsSinceEpoch);
}
