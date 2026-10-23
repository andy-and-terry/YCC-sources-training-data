void main() {
  final nums = [2, 4, 6, 7];

  print(nums.any((n) => n.isOdd));
  print(nums.every((n) => n.isEven));
  print(nums.contains(4));

  print(nums.firstWhere((n) => n > 4));
  print(nums.firstWhere((n) => n > 100, orElse: () => -1));
  print(nums.lastWhere((n) => n.isEven));
  print(nums.indexWhere((n) => n == 6));

  final empty = <int>[];
  print(empty.every((n) => n > 0));
  print(empty.any((n) => n > 0));
}
