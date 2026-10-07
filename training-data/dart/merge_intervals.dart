List<List<int>> mergeIntervals(List<List<int>> intervals) {
  final sorted = List<List<int>>.from(intervals)
    ..sort((a, b) => a[0].compareTo(b[0]));
  final result = <List<int>>[];

  for (final interval in sorted) {
    if (result.isEmpty || result.last[1] < interval[0]) {
      result.add(interval);
    } else {
      result.last[1] = result.last[1] > interval[1] ? result.last[1] : interval[1];
    }
  }

  return result;
}

void main() {
  final intervals = [
    [1, 3],
    [2, 6],
    [8, 10],
    [15, 18],
  ];
  print(mergeIntervals(intervals));
}
