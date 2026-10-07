class MinPriorityQueue {
  final List<int> _heap = [];

  bool get isEmpty => _heap.isEmpty;

  void push(int value) {
    _heap.add(value);
    var i = _heap.length - 1;
    while (i > 0) {
      final parent = (i - 1) ~/ 2;
      if (_heap[parent] <= _heap[i]) break;
      _swap(parent, i);
      i = parent;
    }
  }

  int pop() {
    final top = _heap.first;
    _heap[0] = _heap.last;
    _heap.removeLast();
    var i = 0;
    while (true) {
      final left = 2 * i + 1;
      final right = 2 * i + 2;
      var smallest = i;
      if (left < _heap.length && _heap[left] < _heap[smallest]) smallest = left;
      if (right < _heap.length && _heap[right] < _heap[smallest]) smallest = right;
      if (smallest == i) break;
      _swap(smallest, i);
      i = smallest;
    }
    return top;
  }

  void _swap(int a, int b) {
    final tmp = _heap[a];
    _heap[a] = _heap[b];
    _heap[b] = tmp;
  }
}

void main() {
  final pq = MinPriorityQueue();
  for (final v in [5, 3, 8, 1, 9, 2]) {
    pq.push(v);
  }
  final result = <int>[];
  while (!pq.isEmpty) {
    result.add(pq.pop());
  }
  print(result);
}
