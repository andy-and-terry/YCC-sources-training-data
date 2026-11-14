sealed class Shape {}

class Circle extends Shape {
  final double r;
  Circle(this.r);
}

class Square extends Shape {
  final double s;
  Square(this.s);
}

double area(Shape s) => switch (s) {
      Circle(:final r) => 3.14159 * r * r,
      Square(:final s) => s * s,
    };

void main() => print(area(Square(3)));
