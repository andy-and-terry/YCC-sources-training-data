int equilibriumIndex(List<int> nums) {
  final total = nums.fold(0, (a, b) => a + b);
  var left = 0;
  for (var i = 0; i < nums.length; i++) {
    if (left == total - left - nums[i]) return i;
    left += nums[i];
  }
  return -1;
}

void main() {
  print(equilibriumIndex([1, 7, 3, 6, 5, 6])); // 3
}
