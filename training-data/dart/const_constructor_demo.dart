class Point {
  final int x;
  final int y;
  const Point(this.x, this.y);

  @override
  String toString() => 'Point($x, $y)';
}

void main() {
  const a = Point(1, 2);
  const b = Point(1, 2);
  final c = Point(1, 2);
  final d = Point(1, 2);

  print(identical(a, b));
  print(identical(c, d));
  print(a == b);

  const list = [Point(0, 0), Point(1, 1)];
  print(list);

  const names = <String>{'x', 'y'};
  print(names.contains('x'));

  const int answer = 6 * 7;
  print(answer);
}
