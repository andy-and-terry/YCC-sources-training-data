class Point implements Comparable<Point> {
  final int x;
  final int y;

  const Point(this.x, this.y);

  int get _magnitudeSquared => x * x + y * y;

  @override
  int compareTo(Point other) =>
      _magnitudeSquared.compareTo(other._magnitudeSquared);

  @override
  bool operator ==(Object other) =>
      other is Point && other.x == x && other.y == y;

  @override
  int get hashCode => Object.hash(x, y);

  @override
  String toString() => 'Point($x, $y)';
}

void main() {
  final points = [Point(3, 4), Point(1, 1), Point(0, 5)];
  points.sort();
  print(points);
  print(Point(1, 1) == Point(1, 1));
  print({Point(1, 1), Point(1, 1)}.length);
}
