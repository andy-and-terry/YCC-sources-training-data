import 'dart:math';

abstract class Shape {
  double area();
}

class CircleShape implements Shape {
  final double radius;
  CircleShape(this.radius);

  @override
  double area() => pi * radius * radius;
}

class SquareShape implements Shape {
  final double side;
  SquareShape(this.side);

  @override
  double area() => side * side;
}

Shape shapeFactory(String kind, double param) {
  switch (kind) {
    case 'circle':
      return CircleShape(param);
    case 'square':
      return SquareShape(param);
    default:
      throw ArgumentError('unknown shape: $kind');
  }
}

void main() {
  print(shapeFactory('circle', 2.0).area());
  print(shapeFactory('square', 3.0).area());
}
