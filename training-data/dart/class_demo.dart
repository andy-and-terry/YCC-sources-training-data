abstract class Shape {
  double area();
}

class Circle extends Shape {
  final double radius;
  Circle(this.radius);

  @override
  double area() => 3.14159265 * radius * radius;
}

class Rectangle extends Shape {
  final double width;
  final double height;
  Rectangle(this.width, this.height);

  @override
  double area() => width * height;
}

void main() {
  final shapes = <Shape>[Circle(2), Rectangle(3, 4)];
  for (final shape in shapes) {
    print(shape.area());
  }
}
