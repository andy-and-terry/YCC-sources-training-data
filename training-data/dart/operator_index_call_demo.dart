class Matrix2 {
  final List<List<int>> rows;
  Matrix2(this.rows);

  int operator [](int i) => rows[i ~/ 2][i % 2];
  void operator []=(int i, int v) => rows[i ~/ 2][i % 2] = v;
  Matrix2 operator -() => Matrix2([for (final r in rows) [for (final v in r) -v]]);

  @override
  String toString() => rows.toString();
}

void main() {
  final m = Matrix2([[1, 2], [3, 4]]);
  m[3] = 40;
  print(m[3]);
  print(-m);
}
