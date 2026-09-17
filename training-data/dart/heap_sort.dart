void _heapify(List<int> arr, int n, int i) {
  var largest = i;
  final left = 2 * i + 1;
  final right = 2 * i + 2;

  if (left < n && arr[left] > arr[largest]) largest = left;
  if (right < n && arr[right] > arr[largest]) largest = right;

  if (largest != i) {
    final tmp = arr[i];
    arr[i] = arr[largest];
    arr[largest] = tmp;
    _heapify(arr, n, largest);
  }
}

List<int> heapSort(List<int> arr) {
  final a = List<int>.from(arr);
  final n = a.length;

  for (var i = n ~/ 2 - 1; i >= 0; i--) {
    _heapify(a, n, i);
  }

  for (var i = n - 1; i > 0; i--) {
    final tmp = a[0];
    a[0] = a[i];
    a[i] = tmp;
    _heapify(a, i, 0);
  }

  return a;
}

void main() {
  print(heapSort([5, 3, 8, 1, 9, 2]));
}
