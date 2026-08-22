List<int> bubbleSort(List<int> arr) {
  final a = List<int>.from(arr);
  for (var i = 0; i < a.length; i++) {
    for (var j = 0; j < a.length - i - 1; j++) {
      if (a[j] > a[j + 1]) {
        final temp = a[j];
        a[j] = a[j + 1];
        a[j + 1] = temp;
      }
    }
  }
  return a;
}

void main() {
  print(bubbleSort([5, 2, 9, 1, 5, 6]));
}
