void main() {
  final date = RegExp(r'(?<year>\d{4})-(?<month>\d{2})-(?<day>\d{2})');
  final m = date.firstMatch('Released 2024-03-15.');
  if (m != null) {
    print('${m.namedGroup('day')}/${m.namedGroup('month')}/${m.namedGroup('year')}');
    print(m.group(0));
  }

  for (final hit in RegExp(r'\d+').allMatches('a1b22c333')) {
    print(hit.group(0));
  }

  print('a  b   c'.replaceAll(RegExp(r'\s+'), ' '));
  print('hello world'.replaceAllMapped(
      RegExp(r'\b\w'), (m) => m.group(0)!.toUpperCase()));
  print(RegExp(r'^\w+@\w+\.\w+$').hasMatch('me@site.com'));
  print('one1two22three'.split(RegExp(r'\d+')));
}
