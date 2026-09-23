List<List<int>> permutations(List<int> nums) {
  final result = <List<int>>[];
  final used = List<bool>.filled(nums.length, false);
  final current = <int>[];

  void backtrack() {
    if (current.length == nums.length) {
      result.add(List<int>.from(current));
      return;
    }
    for (var i = 0; i < nums.length; i++) {
      if (used[i]) continue;
      used[i] = true;
      current.add(nums[i]);
      backtrack();
      current.removeLast();
      used[i] = false;
    }
  }

  backtrack();
  return result;
}

void main() {
  for (final perm in permutations([1, 2, 3])) {
    print(perm);
  }
}
