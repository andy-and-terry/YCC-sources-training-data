abstract class Shape : Object {
    public abstract double area();
}

class Circle : Shape {
    double radius;
    public Circle(double radius) {
        this.radius = radius;
    }
    public override double area() {
        return Math.PI * radius * radius;
    }
}

class Square : Shape {
    double side;
    public Square(double side) {
        this.side = side;
    }
    public override double area() {
        return side * side;
    }
}

Shape shape_factory(string kind, double param) {
    switch (kind) {
        case "circle":
            return new Circle(param);
        case "square":
            return new Square(param);
        default:
            error("unknown shape kind: %s", kind);
    }
}

void main() {
    Shape circle = shape_factory("circle", 3.0);
    Shape square = shape_factory("square", 4.0);

    stdout.printf("circle area: %.2f\n", circle.area());
    stdout.printf("square area: %.2f\n", square.area());
}
