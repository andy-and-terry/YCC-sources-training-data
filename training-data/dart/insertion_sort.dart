List<int> insertionSort(List<int> arr) {
  final a = List<int>.from(arr);
  for (var i = 1; i < a.length; i++) {
    final key = a[i];
    var j = i - 1;
    while (j >= 0 && a[j] > key) {
      a[j + 1] = a[j];
      j--;
    }
    a[j + 1] = key;
  }
  return a;
}

void main() {
  print(insertionSort([12, 11, 13, 5, 6]));
}
