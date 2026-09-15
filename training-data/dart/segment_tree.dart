class SegmentTree {
  late List<int> _tree;
  late int _n;

  SegmentTree(List<int> data) {
    _n = data.length;
    _tree = List<int>.filled(4 * _n, 0);
    if (_n > 0) _build(data, 1, 0, _n - 1);
  }

  void _build(List<int> data, int node, int start, int end) {
    if (start == end) {
      _tree[node] = data[start];
      return;
    }
    final mid = (start + end) ~/ 2;
    _build(data, 2 * node, start, mid);
    _build(data, 2 * node + 1, mid + 1, end);
    _tree[node] = _tree[2 * node] + _tree[2 * node + 1];
  }

  int query(int left, int right) => _query(1, 0, _n - 1, left, right);

  int _query(int node, int start, int end, int left, int right) {
    if (right < start || end < left) return 0;
    if (left <= start && end <= right) return _tree[node];
    final mid = (start + end) ~/ 2;
    return _query(2 * node, start, mid, left, right) +
        _query(2 * node + 1, mid + 1, end, left, right);
  }

  void update(int index, int value) => _update(1, 0, _n - 1, index, value);

  void _update(int node, int start, int end, int index, int value) {
    if (start == end) {
      _tree[node] = value;
      return;
    }
    final mid = (start + end) ~/ 2;
    if (index <= mid) {
      _update(2 * node, start, mid, index, value);
    } else {
      _update(2 * node + 1, mid + 1, end, index, value);
    }
    _tree[node] = _tree[2 * node] + _tree[2 * node + 1];
  }
}

void main() {
  final tree = SegmentTree([1, 3, 5, 7, 9, 11]);
  print(tree.query(1, 3));
  tree.update(1, 10);
  print(tree.query(1, 3));
}
