void main() {
  final admin = true;
  final items = [
    'home',
    if (admin) 'admin',
    for (var i = 1; i <= 2; i++) 'page$i',
    ...['a', 'b'],
  ];
  print(items);
  final m = {for (final k in ['x', 'y']) k: k.codeUnitAt(0)};
  print(m);
}
