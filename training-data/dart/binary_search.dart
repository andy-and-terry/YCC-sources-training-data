int binarySearch(List<int> sorted, int target) {
  var lo = 0, hi = sorted.length - 1;
  while (lo <= hi) {
    final mid = lo + (hi - lo) ~/ 2;
    if (sorted[mid] == target) {
      return mid;
    } else if (sorted[mid] < target) {
      lo = mid + 1;
    } else {
      hi = mid - 1;
    }
  }
  return -1;
}

void main() {
  final nums = [1, 3, 5, 7, 9, 11, 13];
  print(binarySearch(nums, 7));
  print(binarySearch(nums, 2));
  print(binarySearch(nums, 1));
  print(binarySearch(nums, 13));
}
