int lisLength(List<int> a) {
  final tails = <int>[];
  for (final x in a) {
    var lo = 0, hi = tails.length;
    while (lo < hi) {
      final mid = (lo + hi) >> 1;
      if (tails[mid] < x) {
        lo = mid + 1;
      } else {
        hi = mid;
      }
    }
    if (lo == tails.length) {
      tails.add(x);
    } else {
      tails[lo] = x;
    }
  }
  return tails.length;
}

void main() => print(lisLength([10, 9, 2, 5, 3, 7, 101, 18]));
