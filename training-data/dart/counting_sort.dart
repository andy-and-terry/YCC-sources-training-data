List<int> countingSort(List<int> arr) {
  if (arr.isEmpty) return arr;

  final maxVal = arr.reduce((a, b) => a > b ? a : b);
  final counts = List<int>.filled(maxVal + 1, 0);
  for (final v in arr) {
    counts[v]++;
  }

  final result = <int>[];
  for (var value = 0; value < counts.length; value++) {
    for (var i = 0; i < counts[value]; i++) {
      result.add(value);
    }
  }

  return result;
}

void main() {
  final data = [5, 3, 8, 1, 9, 3, 5, 0, 2];
  print(countingSort(data));
}
