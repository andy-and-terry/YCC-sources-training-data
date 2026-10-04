class Point {
  final int x;
  final int y;
  const Point(this.x, this.y);

  const Point.origin()
      : x = 0,
        y = 0;

  @override
  String toString() => 'Point($x, $y)';
}

void main() {
  const p1 = Point(1, 2);
  const p2 = Point(1, 2);
  final p3 = Point(1, 2);

  print(identical(p1, p2));
  print(identical(p1, p3));
  print(Point.origin());

  const list = [Point(0, 0), Point(1, 1)];
  print(list);

  try {
    (list as List).add(const Point(2, 2));
  } on UnsupportedError catch (e) {
    print('const list is immutable: ${e.runtimeType}');
  }

  const map = {'a': 1, 'b': 2};
  print(map.length);
}
