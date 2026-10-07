int binarySearch(List<int> sorted, int target) {
  var low = 0;
  var high = sorted.length - 1;

  while (low <= high) {
    final mid = low + (high - low) ~/ 2;
    if (sorted[mid] == target) return mid;
    if (sorted[mid] < target) {
      low = mid + 1;
    } else {
      high = mid - 1;
    }
  }
  return -1;
}

void main() {
  final numbers = [1, 3, 5, 7, 9, 11, 13];
  print(binarySearch(numbers, 7));
  print(binarySearch(numbers, 4));
}
