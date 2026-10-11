void main() {
  final a = [10, 20, 30, 40, 50, 60];
  print(a.sublist(1, 4));
  print(a.getRange(2, 5).toList());
  print(a.take(2).toList());
  print(a.skip(4).toList());
  a.replaceRange(1, 3, [0]);
  print(a);
  a.removeRange(0, 2);
  print(a);
  a.insertAll(1, [7, 8]);
  print(a);
}
