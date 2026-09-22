interface Shape : Object {
    public abstract double area();
}

class Circle : Object, Shape {
    double radius;

    public Circle(double radius) {
        this.radius = radius;
    }

    public double area() {
        return Math.PI * radius * radius;
    }
}

class Square : Object, Shape {
    double side;

    public Square(double side) {
        this.side = side;
    }

    public double area() {
        return side * side;
    }
}

enum ShapeKind {
    CIRCLE,
    SQUARE
}

class ShapeFactory : Object {
    public static Shape create(ShapeKind kind, double size) {
        switch (kind) {
            case ShapeKind.CIRCLE:
                return new Circle(size);
            case ShapeKind.SQUARE:
                return new Square(size);
            default:
                return new Circle(size);
        }
    }
}

void main() {
    Shape circle = ShapeFactory.create(ShapeKind.CIRCLE, 2.0);
    Shape square = ShapeFactory.create(ShapeKind.SQUARE, 3.0);

    stdout.printf("%.2f\n", circle.area());
    stdout.printf("%.2f\n", square.area());
}
