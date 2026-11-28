class SqrtSum {
  final List<int> a;
  final int bs;
  late final List<int> blk;

  SqrtSum(this.a, this.bs) {
    blk = [for (var i = 0; i < a.length; i += bs) a.skip(i).take(bs).reduce((x, y) => x + y)];
  }

  int query(int l, int r) {
    var s = 0, i = l;
    while (i <= r) {
      if (i % bs == 0 && i + bs - 1 <= r) {
        s += blk[i ~/ bs];
        i += bs;
      } else {
        s += a[i++];
      }
    }
    return s;
  }
}

void main() => print(SqrtSum([5, 3, 8, 1, 9, 2, 7, 4, 6, 0, 3, 5], 4).query(2, 9));
