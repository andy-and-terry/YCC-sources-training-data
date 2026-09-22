int binarySearch(List<int> nums, int target) {
  var low = 0;
  var high = nums.length - 1;

  while (low <= high) {
    final mid = low + (high - low) ~/ 2;
    if (nums[mid] == target) {
      return mid;
    } else if (nums[mid] < target) {
      low = mid + 1;
    } else {
      high = mid - 1;
    }
  }

  return -1;
}

void main() {
  final nums = [1, 3, 5, 7, 9, 11, 13];
  print(binarySearch(nums, 7));
  print(binarySearch(nums, 1));
  print(binarySearch(nums, 13));
  print(binarySearch(nums, 4));
}
