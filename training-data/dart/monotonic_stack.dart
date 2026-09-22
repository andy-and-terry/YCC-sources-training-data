List<int> nextGreaterElement(List<int> nums) {
  final result = List<int>.filled(nums.length, -1);
  final stack = <int>[];

  for (var i = nums.length - 1; i >= 0; i--) {
    while (stack.isNotEmpty && stack.last <= nums[i]) {
      stack.removeLast();
    }
    result[i] = stack.isEmpty ? -1 : stack.last;
    stack.add(nums[i]);
  }

  return result;
}

void main() {
  final nums = [2, 1, 2, 4, 3, 1];
  print(nextGreaterElement(nums));
}
