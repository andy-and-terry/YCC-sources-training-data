(int, int)? findPairWithSum(List<int> sorted, int target) {
  var left = 0;
  var right = sorted.length - 1;

  while (left < right) {
    final sum = sorted[left] + sorted[right];
    if (sum == target) return (left, right);
    if (sum < target) {
      left++;
    } else {
      right--;
    }
  }
  return null;
}

void main() {
  final numbers = [1, 2, 4, 6, 8, 11];
  print(findPairWithSum(numbers, 10));
  print(findPairWithSum(numbers, 100));
}
