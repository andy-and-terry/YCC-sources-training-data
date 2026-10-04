void main() {
  final datePattern = RegExp(r'(\d{4})-(\d{2})-(\d{2})');
  const text = 'From 2024-01-15 until 2024-03-20.';

  final first = datePattern.firstMatch(text);
  if (first != null) {
    print(first.group(0));
    print('year=${first.group(1)} month=${first.group(2)}');
  }

  for (final m in datePattern.allMatches(text)) {
    print('${m.start}-${m.end}: ${m[0]}');
  }

  print(text.replaceAllMapped(datePattern, (m) => '${m[3]}/${m[2]}/${m[1]}'));

  final named = RegExp(r'(?<user>\w+)@(?<host>[\w.]+)');
  final m = named.firstMatch('mail bob@example.com now')!;
  print('${m.namedGroup('user')} at ${m.namedGroup('host')}');

  print(RegExp(r'^\d+$').hasMatch('12345'));
  print('a1b22c333'.split(RegExp(r'\d+')));
}
