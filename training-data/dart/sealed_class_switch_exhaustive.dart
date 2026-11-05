sealed class Shape {}
class Circle extends Shape { final double r; Circle(this.r); }
class Square extends Shape { final double s; Square(this.s); }

double area(Shape x) => switch (x) {
      Circle(r: var r) => 3.14159 * r * r,
      Square(s: var s) => s * s,
    };

void main() {
  print(area(Circle(1)));
  print(area(Square(3)));
}
