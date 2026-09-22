interface ShapeVisitor {
    double visitCircle(Circle circle)
    double visitSquare(Square square)
}

interface Shape {
    double accept(ShapeVisitor visitor)
}

class Circle implements Shape {
    double radius

    Circle(double radius) { this.radius = radius }

    double accept(ShapeVisitor visitor) {
        return visitor.visitCircle(this)
    }
}

class Square implements Shape {
    double side

    Square(double side) { this.side = side }

    double accept(ShapeVisitor visitor) {
        return visitor.visitSquare(this)
    }
}

class AreaVisitor implements ShapeVisitor {
    double visitCircle(Circle circle) {
        return Math.PI * circle.radius * circle.radius
    }

    double visitSquare(Square square) {
        return square.side * square.side
    }
}

class PerimeterVisitor implements ShapeVisitor {
    double visitCircle(Circle circle) {
        return 2 * Math.PI * circle.radius
    }

    double visitSquare(Square square) {
        return 4 * square.side
    }
}

def shapes = [new Circle(3.0), new Square(4.0)]
def areaVisitor = new AreaVisitor()
def perimeterVisitor = new PerimeterVisitor()

shapes.each { shape ->
    println "area=${shape.accept(areaVisitor).round(2)} perimeter=${shape.accept(perimeterVisitor).round(2)}"
}
