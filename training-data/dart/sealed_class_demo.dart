sealed class Shape {}

class Circle extends Shape {
  final double radius;
  Circle(this.radius);
}

class Square extends Shape {
  final double side;
  Square(this.side);
}

class Triangle extends Shape {
  final double base;
  final double height;
  Triangle(this.base, this.height);
}

double area(Shape shape) {
  return switch (shape) {
    Circle(radius: var r) => 3.14159 * r * r,
    Square(side: var s) => s * s,
    Triangle(base: var b, height: var h) => 0.5 * b * h,
  };
}

void main() {
  final shapes = [Circle(2), Square(3), Triangle(4, 5)];
  for (final shape in shapes) {
    print(area(shape).toStringAsFixed(2));
  }
}
