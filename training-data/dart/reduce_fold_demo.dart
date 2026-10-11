void main() {
  final nums = [3, 9, 4, 12, 7];
  print(nums.reduce((a, b) => a > b ? a : b));
  print(nums.fold<int>(0, (sum, n) => sum + n));
  print(nums.fold<String>('', (s, n) => s.isEmpty ? '$n' : '$s-$n'));
  print(nums.every((n) => n > 2));
  print(nums.any((n) => n.isEven));
  print(nums.indexWhere((n) => n > 8));
}
