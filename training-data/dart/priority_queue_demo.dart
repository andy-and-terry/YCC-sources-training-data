class PriorityQueue {
  final List<int> _heap = [];

  void push(int value) {
    _heap.add(value);
    int i = _heap.length - 1;
    while (i > 0) {
      final parent = (i - 1) ~/ 2;
      if (_heap[i] >= _heap[parent]) break;
      _swap(i, parent);
      i = parent;
    }
  }

  int pop() {
    final top = _heap.first;
    final last = _heap.removeLast();
    if (_heap.isNotEmpty) {
      _heap[0] = last;
      _siftDown(0);
    }
    return top;
  }

  void _siftDown(int i) {
    final n = _heap.length;
    while (true) {
      final left = 2 * i + 1;
      final right = 2 * i + 2;
      var smallest = i;
      if (left < n && _heap[left] < _heap[smallest]) smallest = left;
      if (right < n && _heap[right] < _heap[smallest]) smallest = right;
      if (smallest == i) break;
      _swap(i, smallest);
      i = smallest;
    }
  }

  void _swap(int a, int b) {
    final tmp = _heap[a];
    _heap[a] = _heap[b];
    _heap[b] = tmp;
  }

  bool get isEmpty => _heap.isEmpty;
}

void main() {
  final pq = PriorityQueue();
  for (final v in [5, 2, 8, 1, 9, 3]) {
    pq.push(v);
  }
  while (!pq.isEmpty) {
    print(pq.pop());
  }
}
