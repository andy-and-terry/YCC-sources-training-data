sealed class Shape {}

class Circle extends Shape {
  final double r;
  Circle(this.r);
}

class Rect extends Shape {
  final double w, h;
  Rect(this.w, this.h);
}

double area(Shape s) => switch (s) {
      Circle(r: var r) => 3.14159 * r * r,
      Rect(w: var w, h: var h) => w * h,
    };

String classify(int n) => switch (n) {
      < 0 => 'negative',
      0 => 'zero',
      > 0 && < 10 => 'small',
      _ => 'large',
    };

void main() {
  print(area(Circle(2)));
  print(area(Rect(2, 3)));
  print([-1, 0, 5, 50].map(classify).toList());
}
