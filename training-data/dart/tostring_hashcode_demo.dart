class Point {
  final int x, y;
  const Point(this.x, this.y);

  @override
  bool operator ==(Object other) =>
      other is Point && other.x == x && other.y == y;

  @override
  int get hashCode => Object.hash(x, y);

  @override
  String toString() => 'Point($x, $y)';
}

void main() {
  final seen = <Point>{Point(1, 2), Point(1, 2), Point(3, 4)};
  print(seen);
  print(seen.length);
  print(seen.contains(Point(3, 4)));
}
