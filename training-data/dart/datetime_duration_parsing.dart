void main() {
  var d = DateTime.utc(2024, 2, 28, 12, 30);
  print(d.add(Duration(days: 2)).toIso8601String());
  print('${d.weekday} ${d.month} ${d.year} ${d.isUtc}');
  print(DateTime.parse('2024-03-05T10:00:00Z').difference(d).inHours);
  print(d.isBefore(DateTime.utc(2025)) && d.isAfter(DateTime.utc(2000)));
  var dur = Duration(hours: 1, minutes: 90, seconds: 30);
  print('${dur.inMinutes} ${dur.inSeconds} $dur');
  print(DateTime.utc(2024, 3, 0).day);
  print(DateTime.fromMillisecondsSinceEpoch(0, isUtc: true));
  print(d.millisecondsSinceEpoch);
  print(DateTime.tryParse('bad') == null);
  print(Duration(seconds: 90) > Duration(minutes: 1));
  print(d.copyWith(hour: 0, minute: 0));
}
