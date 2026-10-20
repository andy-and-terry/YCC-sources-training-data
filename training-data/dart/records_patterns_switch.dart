sealed class Shape {}
class Circle extends Shape { final double r; Circle(this.r); }
class Square extends Shape { final double s; Square(this.s); }
class Rect extends Shape { final double w, h; Rect(this.w, this.h); }

double area(Shape s) => switch (s) {
      Circle(r: var r) => 3.14159 * r * r,
      Square(s: var side) => side * side,
      Rect(w: var w, h: var h) => w * h,
    };

(int, String) pair() => (1, 'one');

void main() {
  print([Circle(1), Square(2), Rect(2, 3)].map(area).toList());
  var (n, label) = pair();
  print('$n $label');
  var rec = (name: 'Ada', age: 36);
  print('${rec.name} ${rec.age}');
  if (rec case (name: String nm, age: int a) when a > 30) print('$nm is over 30');
  final [first, ...rest] = [1, 2, 3];
  print('$first $rest');
}
