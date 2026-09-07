int longestIncreasingSubsequence(List<int> nums) {
  if (nums.isEmpty) return 0;
  final tails = <int>[];

  for (final num in nums) {
    var lo = 0, hi = tails.length;
    while (lo < hi) {
      final mid = (lo + hi) ~/ 2;
      if (tails[mid] < num) {
        lo = mid + 1;
      } else {
        hi = mid;
      }
    }
    if (lo == tails.length) {
      tails.add(num);
    } else {
      tails[lo] = num;
    }
  }

  return tails.length;
}

void main() {
  print(longestIncreasingSubsequence([10, 9, 2, 5, 3, 7, 101, 18]));
  print(longestIncreasingSubsequence([0, 1, 0, 3, 2, 3]));
}
