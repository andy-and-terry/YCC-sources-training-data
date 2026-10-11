void main() {
  print('apple'.compareTo('banana'));
  print('Zebra'.toLowerCase().compareTo('apple'));
  print('Dart'.toUpperCase());
  print('  hi  '.trim().length);
  print('a,b,,c'.split(','));
  print('hello world'.split(' ').map((w) => w[0].toUpperCase() + w.substring(1)).join(' '));
  print('abc'.contains('bc') && 'abc'.startsWith('a') && 'abc'.endsWith('c'));
  print('banana'.indexOf('an', 2));
}
