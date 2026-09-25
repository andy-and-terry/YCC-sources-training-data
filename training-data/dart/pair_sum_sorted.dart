(int, int)? pairWithSum(List<int> nums, int target) {
  var i = 0, j = nums.length - 1;
  while (i < j) {
    final s = nums[i] + nums[j];
    if (s == target) return (i, j);
    if (s < target) {
      i++;
    } else {
      j--;
    }
  }
  return null;
}

void main() {
  print(pairWithSum([1, 3, 4, 6, 8, 11], 10));
  print(pairWithSum([1, 2, 3], 100));
}
