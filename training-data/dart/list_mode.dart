List<int> modes(List<int> items) {
  final counts = <int, int>{};
  for (final x in items) {
    counts[x] = (counts[x] ?? 0) + 1;
  }
  final top = counts.values.reduce((a, b) => a > b ? a : b);
  return counts.entries.where((e) => e.value == top).map((e) => e.key).toList()..sort();
}

void main() => print(modes([1, 2, 2, 3, 3, 4]));
