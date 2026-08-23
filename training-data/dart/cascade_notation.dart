class Point {
  double x = 0;
  double y = 0;

  void move(double dx, double dy) {
    x += dx;
    y += dy;
  }

  @override
  String toString() => '($x, $y)';
}

void main() {
  final p = Point()
    ..move(1, 2)
    ..move(3, 4);
  print(p);
}
