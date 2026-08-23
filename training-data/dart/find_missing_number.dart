int findMissing(List<int> arr, int n) {
  final expectedSum = n * (n + 1) ~/ 2;
  final actualSum = arr.fold(0, (acc, x) => acc + x);
  return expectedSum - actualSum;
}

void main() {
  print(findMissing([1, 2, 4, 5, 6], 6));
}
