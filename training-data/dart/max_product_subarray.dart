import 'dart:math';

int maxProduct(List<int> nums) {
  var best = nums.first, hi = nums.first, lo = nums.first;
  for (final x in nums.skip(1)) {
    if (x < 0) (hi, lo) = (lo, hi);
    hi = max(x, hi * x);
    lo = min(x, lo * x);
    best = max(best, hi);
  }
  return best;
}

void main() {
  print([
    [2, 3, -2, 4],
    [-2, 0, -1],
    [-2, 3, -4],
  ].map(maxProduct).toList());
}
