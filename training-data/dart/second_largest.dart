int secondLargest(List<int> arr) {
  final sorted = arr.toSet().toList()..sort((a, b) => b.compareTo(a));
  return sorted[1];
}

void main() {
  print(secondLargest([5, 3, 8, 1, 9, 2]));
}
