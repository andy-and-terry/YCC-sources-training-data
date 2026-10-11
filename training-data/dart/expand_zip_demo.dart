void main() {
  final nested = [[1, 2], [3], [4, 5, 6]];
  print(nested.expand((l) => l).toList());
  print([1, 2, 3].expand((n) => [n, n * 10]).toList());

  final a = ['x', 'y', 'z'];
  final b = [1, 2, 3];
  final zipped = [for (var i = 0; i < a.length; i++) '${a[i]}${b[i]}'];
  print(zipped);
  print(Map.fromIterables(a, b));
}
