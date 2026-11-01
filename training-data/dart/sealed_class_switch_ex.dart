sealed class Shape {}
class Circle extends Shape { final double r; Circle(this.r); }
class Rect extends Shape { final double w, h; Rect(this.w, this.h); }

double area(Shape s) => switch (s) {
      Circle(r: var r) => 3.14159 * r * r,
      Rect(w: var w, h: var h) => w * h,
    };

void main() {
  print(area(Circle(2)));
  print(area(Rect(3, 4)));
}
