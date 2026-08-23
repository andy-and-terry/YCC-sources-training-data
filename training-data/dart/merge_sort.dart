List<int> mergeSort(List<int> arr) {
  if (arr.length <= 1) return arr;
  final mid = arr.length ~/ 2;
  final left = mergeSort(arr.sublist(0, mid));
  final right = mergeSort(arr.sublist(mid));
  return merge(left, right);
}

List<int> merge(List<int> left, List<int> right) {
  final result = <int>[];
  var i = 0, j = 0;
  while (i < left.length && j < right.length) {
    if (left[i] <= right[j]) {
      result.add(left[i++]);
    } else {
      result.add(right[j++]);
    }
  }
  result.addAll(left.sublist(i));
  result.addAll(right.sublist(j));
  return result;
}

void main() {
  print(mergeSort([5, 2, 9, 1, 5, 6]));
}
