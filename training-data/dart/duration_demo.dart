String format(Duration d) {
  final h = d.inHours;
  final m = d.inMinutes.remainder(60).toString().padLeft(2, '0');
  final s = d.inSeconds.remainder(60).toString().padLeft(2, '0');
  return '$h:$m:$s';
}

void main() {
  const d = Duration(hours: 1, minutes: 30, seconds: 15);
  print(format(d));
  print(d.inSeconds);
  print(d + const Duration(minutes: 45));
  print(d * 2);
  print(d > const Duration(hours: 1));
  print(const Duration(milliseconds: 2500).inSeconds);
  print(Duration.zero.isNegative);
  print((const Duration(seconds: 5) - const Duration(seconds: 9)).isNegative);

  final start = DateTime.utc(2024, 1, 31);
  final end = start.add(const Duration(days: 30));
  print(end.toIso8601String());
  print(end.difference(start).inDays);
}
