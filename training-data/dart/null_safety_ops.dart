void main() {
  String? s;
  print(s?.length);
  print(s ?? 'default');
  s ??= 'set';
  print(s!.length);
}
