List<int> selectionSort(List<int> arr) {
  final a = List<int>.from(arr);
  for (var i = 0; i < a.length - 1; i++) {
    var minIdx = i;
    for (var j = i + 1; j < a.length; j++) {
      if (a[j] < a[minIdx]) minIdx = j;
    }
    final temp = a[i];
    a[i] = a[minIdx];
    a[minIdx] = temp;
  }
  return a;
}

void main() {
  print(selectionSort([64, 25, 12, 22, 11]));
}
