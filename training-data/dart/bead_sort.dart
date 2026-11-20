import 'dart:math';

// Bead (gravity) sort.
List<int> beadSort(List<int> nums) {
  final cols = List.filled(nums.reduce(max), 0);
  for (final n in nums) {
    for (var i = 0; i < n; i++) cols[i]++;
  }
  return [for (var r = 0; r < nums.length; r++) cols.where((c) => c > r).length].reversed.toList();
}

void main() => print(beadSort([5, 3, 1, 4, 2]));
