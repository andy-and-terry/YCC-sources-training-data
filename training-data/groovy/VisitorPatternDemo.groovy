interface ShapeVisitor {
    double visitCircle(Circle c)
    double visitSquare(Square s)
}

interface Shape {
    double accept(ShapeVisitor visitor)
}

class Circle implements Shape {
    double radius

    double accept(ShapeVisitor visitor) { visitor.visitCircle(this) }
}

class Square implements Shape {
    double side

    double accept(ShapeVisitor visitor) { visitor.visitSquare(this) }
}

class AreaVisitor implements ShapeVisitor {
    double visitCircle(Circle c) { Math.PI * c.radius * c.radius }
    double visitSquare(Square s) { s.side * s.side }
}

class PerimeterVisitor implements ShapeVisitor {
    double visitCircle(Circle c) { 2 * Math.PI * c.radius }
    double visitSquare(Square s) { 4 * s.side }
}

List<Shape> shapes = [new Circle(radius: 2), new Square(side: 3)]
def areaVisitor = new AreaVisitor()
def perimeterVisitor = new PerimeterVisitor()

shapes.each { shape ->
    printf("area=%.2f perimeter=%.2f%n", shape.accept(areaVisitor), shape.accept(perimeterVisitor))
}
