void main() {
  String? s;
  print(s?.length ?? -1);
  s ??= 'default';
  print(s.toUpperCase());
  final m = <String, int>{};
  m['a'] ??= 5;
  print(m);
}
