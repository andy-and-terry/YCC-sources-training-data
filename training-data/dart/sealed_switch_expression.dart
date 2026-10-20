sealed class Shape {}
class Circle extends Shape { final double r; Circle(this.r); }
class Sq extends Shape { final double s; Sq(this.s); }

double area(Shape s) => switch (s) {
      Circle(r: var r) => 3.14159 * r * r,
      Sq(s: var s) => s * s,
    };

void main() => print(area(Sq(3)));
