List<int> quicksort(List<int> items) {
  if (items.length <= 1) return items;
  final pivot = items[items.length ~/ 2];
  final left = items.where((x) => x < pivot).toList();
  final mid = items.where((x) => x == pivot).toList();
  final right = items.where((x) => x > pivot).toList();
  return [...quicksort(left), ...mid, ...quicksort(right)];
}

void main() {
  print(quicksort([5, 3, 8, 1, 9, 2]));
}
