abstract class Shape : Object {
    public abstract double area();
    public abstract string kind_name();
}

class Circle : Shape {
    private double radius;

    public Circle(double radius) {
        this.radius = radius;
    }

    public override double area() {
        return Math.PI * radius * radius;
    }

    public override string kind_name() {
        return "Circle";
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

    public override string kind_name() {
        return "Square";
    }
}

class ShapeFactory : Object {
    public static Shape create(string kind, double size) {
        switch (kind) {
            case "circle":
                return new Circle(size);
            case "square":
                return new Square(size);
            default:
                error("unknown shape kind: %s".printf(kind));
        }
    }
}

void main() {
    Shape[] shapes = {
        ShapeFactory.create("circle", 2.0),
        ShapeFactory.create("square", 3.0),
    };

    foreach (Shape s in shapes) {
        stdout.printf("%s area: %.2f\n", s.kind_name(), s.area());
    }
}
