(int, int) minMax(List<int> nums) {
  var min = nums[0];
  var max = nums[0];
  for (final n in nums) {
    if (n < min) min = n;
    if (n > max) max = n;
  }
  return (min, max);
}

void main() {
  final (min, max) = minMax([5, 3, 8, 1, 9, 2]);
  print('min: $min, max: $max');
}
