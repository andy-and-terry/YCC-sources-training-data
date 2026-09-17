abstract class Shape {
    abstract double area()
}

class Circle extends Shape {
    double radius

    Circle(double r) {
        radius = r
    }

    double area() {
        return Math.PI * radius * radius
    }
}

class Square extends Shape {
    double side

    Square(double s) {
        side = s
    }

    double area() {
        return side * side
    }
}

class ShapeFactory {
    static Shape create(String kind, double param) {
        switch (kind) {
            case "circle": return new Circle(param)
            case "square": return new Square(param)
            default: throw new IllegalArgumentException("unknown shape: $kind")
        }
    }
}

println ShapeFactory.create("circle", 2).area()
println ShapeFactory.create("square", 3).area()
