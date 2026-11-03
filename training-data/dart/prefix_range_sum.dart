class RangeSum {
  final List<int> _prefix = [0];

  RangeSum(List<int> values) {
    for (final v in values) {
      _prefix.add(_prefix.last + v);
    }
  }

  int query(int lo, int hi) => _prefix[hi] - _prefix[lo];
}

void main() => print(RangeSum([3, 1, 4, 1, 5, 9, 2, 6]).query(2, 5));
