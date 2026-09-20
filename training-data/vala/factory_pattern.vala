abstract class Shape : Object {
    public abstract double area();
}

class Circle : Shape {
    private double radius;

    public Circle(double radius) {
        this.radius = radius;
    }

    public override double area() {
        return Math.PI * radius * radius;
    }
}

class Square : Shape {
    private double side;

    public Square(double side) {
        this.side = side;
    }

    public override double area() {
        return side * side;
    }
}

Shape create_shape(string kind, double size) {
    switch (kind) {
        case "circle":
            return new Circle(size);
        case "square":
            return new Square(size);
        default:
            error("unknown shape: %s", kind);
    }
}

void main() {
    Shape[] shapes = { create_shape("circle", 2.0), create_shape("square", 3.0) };
    foreach (Shape shape in shapes) {
        stdout.printf("%.2f\n", shape.area());
    }
}
