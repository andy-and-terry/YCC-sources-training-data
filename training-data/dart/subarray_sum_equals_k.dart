// Count contiguous subarrays whose sum equals k (prefix sums + Map).
int countSubarrays(List<int> nums, int k) {
  final seen = <int, int>{0: 1};
  var total = 0, count = 0;
  for (final x in nums) {
    total += x;
    count += seen[total - k] ?? 0;
    seen[total] = (seen[total] ?? 0) + 1;
  }
  return count;
}

void main() => print(countSubarrays([1, 1, 1], 2));
