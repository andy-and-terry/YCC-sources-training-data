abstract class Shape {
  double area();
}

class LegacyRectangle {
  final double legacyWidth;
  final double legacyHeight;

  LegacyRectangle(this.legacyWidth, this.legacyHeight);

  double computeLegacyArea() => legacyWidth * legacyHeight;
}

class RectangleAdapter implements Shape {
  final LegacyRectangle _legacy;

  RectangleAdapter(this._legacy);

  @override
  double area() => _legacy.computeLegacyArea();
}

class Circle implements Shape {
  final double radius;
  Circle(this.radius);

  @override
  double area() => 3.14159 * radius * radius;
}

void main() {
  final shapes = <Shape>[
    Circle(2),
    RectangleAdapter(LegacyRectangle(3, 4)),
  ];

  for (final shape in shapes) {
    print(shape.area().toStringAsFixed(2));
  }
}
