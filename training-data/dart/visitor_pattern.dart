abstract class Shape {
  double accept(AreaVisitor visitor);
}

class Circle implements Shape {
  final double radius;
  Circle(this.radius);

  @override
  double accept(AreaVisitor visitor) => visitor.visitCircle(this);
}

class Square implements Shape {
  final double side;
  Square(this.side);

  @override
  double accept(AreaVisitor visitor) => visitor.visitSquare(this);
}

class AreaVisitor {
  double visitCircle(Circle c) => 3.14159 * c.radius * c.radius;
  double visitSquare(Square s) => s.side * s.side;
}

void main() {
  final shapes = <Shape>[Circle(2), Square(3)];
  final visitor = AreaVisitor();
  for (final shape in shapes) {
    print(shape.accept(visitor));
  }
}
