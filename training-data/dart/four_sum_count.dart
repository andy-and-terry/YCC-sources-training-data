int fourSumCount(List<int> a, List<int> b, List<int> c, List<int> d) {
  final sums = <int, int>{};
  for (final x in a) {
    for (final y in b) {
      sums.update(x + y, (v) => v + 1, ifAbsent: () => 1);
    }
  }
  var count = 0;
  for (final x in c) {
    for (final y in d) {
      count += sums[-(x + y)] ?? 0;
    }
  }
  return count;
}

void main() {
  print(fourSumCount([1, 2], [-2, -1], [-1, 2], [0, 2])); // 2
}
