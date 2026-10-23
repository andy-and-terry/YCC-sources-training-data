abstract class Shape : Object {
    public abstract double area ();
}

class Circle : Shape {
    public double r;
    public Circle (double r) { this.r = r; }
    public override double area () { return Math.PI * r * r; }
}

class Square : Shape {
    public double side;
    public Square (double side) { this.side = side; }
    public override double area () { return side * side; }
}

void main () {
    Shape[] shapes = { new Circle (1.0), new Square (2.0) };

    foreach (Shape s in shapes) {
        if (s is Circle) {
            Circle c = (Circle) s;
            print ("circle r=%.1f\n", c.r);
        } else if (s is Square) {
            Square? sq = s as Square;
            if (sq != null) {
                print ("square side=%.1f\n", sq.side);
            }
        }
        print ("area %.2f\n", s.area ());
    }

    Circle? none = shapes[1] as Circle;
    print ("%s\n", none == null ? "not a circle" : "circle");
}
