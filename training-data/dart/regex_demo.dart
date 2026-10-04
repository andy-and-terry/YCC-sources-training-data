void main() {
  final date = RegExp(r'(\d{4})-(\d{2})-(\d{2})');
  const text = 'From 2023-04-15 to 2024-01-02.';

  for (final m in date.allMatches(text)) {
    print('${m.group(0)} -> y=${m.group(1)} m=${m.group(2)} d=${m.group(3)}');
  }
  print(date.hasMatch('no date'));
  print(text.replaceAllMapped(date, (m) => '${m[3]}/${m[2]}/${m[1]}'));

  final named = RegExp(r'(?<user>\w+)@(?<host>[\w.]+)');
  final m = named.firstMatch('mail bob@example.com now')!;
  print('${m.namedGroup('user')} at ${m.namedGroup('host')}');
}
