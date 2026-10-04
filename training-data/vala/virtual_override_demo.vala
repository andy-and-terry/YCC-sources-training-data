abstract class Shape : Object {
    public string name { get; protected set; default = "shape"; }

    public abstract double area();

    public virtual string describe() {
        return "%s with area %.2f".printf(name, area());
    }
}

class Circle : Shape {
    private double radius;

    public Circle(double radius) {
        this.radius = radius;
        name = "circle";
    }

    public override double area() {
        return Math.PI * radius * radius;
    }
}

class Square : Shape {
    protected double side;

    public Square(double side) {
        this.side = side;
        name = "square";
    }

    public override double area() {
        return side * side;
    }

    public override string describe() {
        return base.describe() + " (side %.1f)".printf(side);
    }
}

class Cube : Square {
    public Cube(double side) {
        base(side);
        name = "cube face";
    }

    public override string describe() {
        return base.describe() + " [x6 = %.1f]".printf(area() * 6);
    }
}

void main() {
    Shape[] shapes = { new Circle(1.5), new Square(2.0), new Cube(3.0) };
    foreach (Shape s in shapes) {
        stdout.printf("%s\n", s.describe());
    }
    Shape first = shapes[0];
    stdout.printf("%s\n", (first is Circle).to_string());
    stdout.printf("%s\n", (first is Square).to_string());
    Square? sq = shapes[2] as Square;
    stdout.printf("%s\n", sq != null ? "cube is a square" : "no");
}
