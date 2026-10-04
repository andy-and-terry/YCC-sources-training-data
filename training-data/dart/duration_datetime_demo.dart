void main() {
  final start = DateTime.utc(2024, 2, 28, 22, 0);
  final end = start.add(const Duration(days: 1, hours: 5));
  print(end.toIso8601String());
  print(end.difference(start));
  print(end.difference(start).inMinutes);
  print(end.weekday == DateTime.friday);
  print(start.isBefore(end));

  final parsed = DateTime.parse('2025-12-31T23:59:59Z');
  print(parsed.add(const Duration(seconds: 1)).year);

  final d = const Duration(hours: 2, minutes: 45, seconds: 30);
  print('${d.inHours}h ${d.inMinutes.remainder(60)}m ${d.inSeconds.remainder(60)}s');
  print(DateTime(2024, 3, 0).day);
}
