import 'dart:collection';

List<int> maxSlidingWindow(List<int> nums, int k) {
  final result = <int>[];
  final deque = Queue<int>(); // stores indices, values decreasing

  for (var i = 0; i < nums.length; i++) {
    while (deque.isNotEmpty && deque.first <= i - k) {
      deque.removeFirst();
    }
    while (deque.isNotEmpty && nums[deque.last] <= nums[i]) {
      deque.removeLast();
    }
    deque.addLast(i);
    if (i >= k - 1) {
      result.add(nums[deque.first]);
    }
  }
  return result;
}

void main() {
  print(maxSlidingWindow([1, 3, -1, -3, 5, 3, 6, 7], 3));
}
