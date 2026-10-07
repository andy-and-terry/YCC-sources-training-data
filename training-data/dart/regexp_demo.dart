void main() {
  final datePattern = RegExp(r'(\d{4})-(\d{2})-(\d{2})');
  const text = 'Released 2024-03-15, patched 2024-04-02.';

  final first = datePattern.firstMatch(text);
  if (first != null) {
    print('year=${first.group(1)} month=${first.group(2)} day=${first.group(3)}');
  }

  for (final m in datePattern.allMatches(text)) {
    print('found ${m.group(0)} at ${m.start}');
  }

  print(text.replaceAllMapped(datePattern, (m) => '${m[3]}/${m[2]}/${m[1]}'));

  final named = RegExp(r'(?<user>\w+)@(?<host>[\w.]+)');
  final email = named.firstMatch('contact: dev@example.com')!;
  print('${email.namedGroup('user')} at ${email.namedGroup('host')}');

  print(RegExp(r'^\d+$').hasMatch('12345'));
  print('a1b22c333'.split(RegExp(r'\d+')));
}
