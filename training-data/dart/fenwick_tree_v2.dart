class FenwickTree {
  final List<int> tree;
  final int size;

  FenwickTree(this.size) : tree = List<int>.filled(size + 1, 0);

  void add(int index, int delta) {
    for (var i = index + 1; i <= size; i += i & (-i)) {
      tree[i] += delta;
    }
  }

  int prefixSum(int index) {
    var total = 0;
    for (var i = index + 1; i > 0; i -= i & (-i)) {
      total += tree[i];
    }
    return total;
  }

  int rangeSum(int left, int right) {
    return left > 0 ? prefixSum(right) - prefixSum(left - 1) : prefixSum(right);
  }
}

void main() {
  final values = [1, 3, 5, 7, 9, 11];
  final tree = FenwickTree(values.length);
  for (var i = 0; i < values.length; i++) {
    tree.add(i, values[i]);
  }

  print(tree.rangeSum(1, 3));
  tree.add(1, 10);
  print(tree.rangeSum(1, 3));
}
