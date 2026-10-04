void main() {
  const s = '  Dart is Fun, Dart is Fast  ';
  final t = s.trim();
  print(t.toUpperCase());
  print(t.replaceAll('Dart', 'Flutter'));
  print(t.split(RegExp(r',\s*')));
  print(t.indexOf('is'));
  print(t.lastIndexOf('is'));
  print(t.startsWith('Dart') && t.endsWith('Fast'));
  print('abc'.padLeft(6, '.') + '|' + 'abc'.padRight(6, '.'));
  print('hello'.split('').reversed.join());
  print('a-b-c'.replaceFirst('-', '+'));
  print(t.substring(5, 7));
  print('ß'.codeUnitAt(0));
  print('x' * 3);
}
