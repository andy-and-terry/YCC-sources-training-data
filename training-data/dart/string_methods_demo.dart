void main() {
  const text = '  Hello, Dart World  ';
  final trimmed = text.trim();
  print(trimmed);
  print(trimmed.toUpperCase());
  print(trimmed.split(', '));
  print(trimmed.contains('Dart'));
  print(trimmed.replaceAll('l', 'L'));
  print(trimmed.substring(7));
  print(trimmed.indexOf('World'));
  print(trimmed.padLeft(20, '*'));
  print(trimmed.padRight(20, '-') + '|');
  print('ab' * 3);
  print(trimmed.codeUnitAt(0));
  print(String.fromCharCodes([68, 97, 114, 116]));
  print(trimmed.split('').reversed.join());
}
