class Rectangle {
  final double width;
  final double height;
  final double area;

  Rectangle(double w, double h)
      : assert(w >= 0 && h >= 0),
        width = w,
        height = h,
        area = w * h;

  Rectangle.square(double side) : this(side, side);
}

void main() {
  print(Rectangle(3, 4).area);
  print(Rectangle.square(5).area);
}
