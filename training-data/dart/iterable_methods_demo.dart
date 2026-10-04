void main() {
  final nums = [5, 3, 8, 1, 9, 2];

  print(nums.where((n) => n > 2).toList());
  print(nums.fold<int>(0, (a, b) => a + b));
  print(nums.reduce((a, b) => a > b ? a : b));
  print(nums.any((n) => n > 8));
  print(nums.every((n) => n > 0));
  print(nums.skip(2).take(3).toList());
  print(nums.takeWhile((n) => n != 1).toList());
  print(nums.firstWhere((n) => n > 5, orElse: () => -1));
  print(nums.expand((n) => [n, n * 10]).take(4).toList());
  print(nums.indexed.where((e) => e.$2.isEven).map((e) => e.$1).toList());
  print(([...nums]..sort()).reversed.toList());
  print(nums.followedBy([0]).last);
}
