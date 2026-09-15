class FenwickTree {
  final List<int> _tree;
  final int _size;

  FenwickTree(int size) : _size = size, _tree = List<int>.filled(size + 1, 0);

  void add(int index, int delta) {
    for (var i = index + 1; i <= _size; i += i & (-i)) {
      _tree[i] += delta;
    }
  }

  int prefixSum(int index) {
    var total = 0;
    for (var i = index + 1; i > 0; i -= i & (-i)) {
      total += _tree[i];
    }
    return total;
  }

  int rangeSum(int left, int right) {
    return prefixSum(right) - (left > 0 ? prefixSum(left - 1) : 0);
  }
}

void main() {
  final ft = FenwickTree(6);
  final values = [1, 3, 5, 7, 9, 11];
  for (var i = 0; i < values.length; i++) {
    ft.add(i, values[i]);
  }
  print(ft.rangeSum(1, 3));
  print(ft.prefixSum(5));
}
