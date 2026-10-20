void main() {
  var s = 'Hello, World';
  print('${s.length} ${s.toUpperCase()} ${s.substring(7)} ${s.indexOf('o')} ${s.replaceAll('l', 'L')}');
  print(s.split(', ').map((w) => w.toLowerCase()).toList());
  print('abc'.padLeft(5, '*') + '|' + 'abc'.padRight(5, '-') + '|' + '  x '.trim() + '|');
  print('${3.14159.toStringAsFixed(2)} ${255.toRadixString(16)} ${int.parse('ff', radix: 16)} ${1e3.toInt()}');
  print('''multi
line''');
  print(r'raw \n $no');
  final re = RegExp(r'(\d+)-(\d+)');
  final m = re.firstMatch('tel 555-1234')!;
  print('${m.group(1)} ${m.group(2)} ${m.start}');
  print(RegExp(r'\d').allMatches('a1b2c3').map((m) => m.group(0)).join());
  print('a1b22'.replaceAllMapped(RegExp(r'\d+'), (m) => '<${m[0]}>'));
  print('hello'.codeUnitAt(0));
  print(String.fromCharCodes([72, 105]));
  print('ab' * 3);
  print('x'.compareTo('y'));
  print('Dart'.split('').reversed.join());
  print(s.contains('World') && s.startsWith('He') && s.endsWith('ld'));
  print('title case words'.split(' ').map((w) => w[0].toUpperCase() + w.substring(1)).join(' '));
}
