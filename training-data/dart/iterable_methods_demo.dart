void main() {
  final nums = [5, 3, 8, 1, 9, 2];

  print(nums.where((n) => n > 3).toList());
  print(nums.map((n) => n * n).toList());
  print(nums.reduce((a, b) => a > b ? a : b));
  print(nums.fold<int>(0, (sum, n) => sum + n));
  print(nums.any((n) => n > 8));
  print(nums.every((n) => n > 0));
  print(nums.take(2).toList());
  print(nums.skip(4).toList());
  print(nums.takeWhile((n) => n != 1).toList());
  print(nums.skipWhile((n) => n != 1).toList());
  print(nums.firstWhere((n) => n.isEven));
  print(nums.firstWhere((n) => n > 100, orElse: () => -1));
  print(nums.expand((n) => [n, -n]).take(4).toList());
  print(nums.indexed.where((e) => e.$1.isEven).map((e) => e.$2).toList());
}
