abstract class Shape {
  double accept(Visitor visitor);
}

class Circle extends Shape {
  final double radius;
  Circle(this.radius);

  @override
  double accept(Visitor visitor) => visitor.visitCircle(this);
}

class Square extends Shape {
  final double side;
  Square(this.side);

  @override
  double accept(Visitor visitor) => visitor.visitSquare(this);
}

abstract class Visitor {
  double visitCircle(Circle circle);
  double visitSquare(Square square);
}

class AreaVisitor implements Visitor {
  @override
  double visitCircle(Circle circle) => 3.14159 * circle.radius * circle.radius;

  @override
  double visitSquare(Square square) => square.side * square.side;
}

void main() {
  final shapes = <Shape>[Circle(2.0), Square(3.0)];
  final visitor = AreaVisitor();
  for (final shape in shapes) {
    print(shape.accept(visitor));
  }
}
