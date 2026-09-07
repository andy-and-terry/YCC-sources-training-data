int quickselect(List<int> nums, int k) {
  final list = List<int>.from(nums);
  return _select(list, 0, list.length - 1, list.length - k);
}

int _select(List<int> list, int left, int right, int targetIndex) {
  if (left == right) return list[left];

  final pivot = list[right];
  var storeIndex = left;
  for (var i = left; i < right; i++) {
    if (list[i] < pivot) {
      _swap(list, storeIndex, i);
      storeIndex++;
    }
  }
  _swap(list, storeIndex, right);

  if (storeIndex == targetIndex) {
    return list[storeIndex];
  } else if (storeIndex < targetIndex) {
    return _select(list, storeIndex + 1, right, targetIndex);
  } else {
    return _select(list, left, storeIndex - 1, targetIndex);
  }
}

void _swap(List<int> list, int i, int j) {
  final tmp = list[i];
  list[i] = list[j];
  list[j] = tmp;
}

void main() {
  print(quickselect([3, 2, 1, 5, 6, 4], 2));
  print(quickselect([3, 2, 3, 1, 2, 4, 5, 5, 6], 4));
}
