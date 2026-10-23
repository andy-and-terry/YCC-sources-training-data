class Rect {
  final double width;
  final double height;

  const Rect(this.width, this.height);

  // Redirecting generative constructor.
  const Rect.square(double side) : this(side, side);

  // Named constructor with an initializer list.
  Rect.fromCorners(double x1, double y1, double x2, double y2)
      : width = (x2 - x1).abs(),
        height = (y2 - y1).abs();

  double get area => width * height;

  @override
  String toString() => 'Rect(${width}x$height)';
}

abstract class Shape {
  // Redirecting factory constructor.
  factory Shape.unit() = _UnitShape;
  String get name;
}

class _UnitShape implements Shape {
  @override
  String get name => 'unit';
}

void main() {
  print(const Rect.square(3).area);
  print(Rect.fromCorners(1, 1, 4, 5));
  print(Shape.unit().name);
}
