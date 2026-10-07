void main() {
  final nums = [5, 3, 8, 1, 9, 2];

  print(nums.where((n) => n.isOdd).toList());
  print(nums.fold<int>(0, (sum, n) => sum + n));
  print(nums.reduce((a, b) => a > b ? a : b));
  print(nums.expand((n) => [n, n * 10]).take(6).toList());
  print(nums.skip(2).take(3).toList());
  print(nums.takeWhile((n) => n != 1).toList());
  print(nums.skipWhile((n) => n != 1).toList());
  print(nums.any((n) => n > 8));
  print(nums.every((n) => n > 0));
  print(nums.indexWhere((n) => n == 8));
  print(nums.sublist(1, 4));
  print(nums.reversed.toList());
  print(nums.asMap().entries.where((e) => e.key.isEven).map((e) => e.value).toList());
}
