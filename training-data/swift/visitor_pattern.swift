protocol ShapeVisitor {
    func visit(_ circle: Circle) -> Double
    func visit(_ rectangle: Rectangle) -> Double
}

protocol Shape {
    func accept(_ visitor: ShapeVisitor) -> Double
}

struct Circle: Shape {
    let radius: Double
    func accept(_ visitor: ShapeVisitor) -> Double {
        visitor.visit(self)
    }
}

struct Rectangle: Shape {
    let width: Double
    let height: Double
    func accept(_ visitor: ShapeVisitor) -> Double {
        visitor.visit(self)
    }
}

struct AreaVisitor: ShapeVisitor {
    func visit(_ circle: Circle) -> Double {
        Double.pi * circle.radius * circle.radius
    }
    func visit(_ rectangle: Rectangle) -> Double {
        rectangle.width * rectangle.height
    }
}

struct PerimeterVisitor: ShapeVisitor {
    func visit(_ circle: Circle) -> Double {
        2 * Double.pi * circle.radius
    }
    func visit(_ rectangle: Rectangle) -> Double {
        2 * (rectangle.width + rectangle.height)
    }
}

let shapes: [Shape] = [Circle(radius: 2), Rectangle(width: 3, height: 4)]
let areaVisitor = AreaVisitor()
let perimeterVisitor = PerimeterVisitor()

for shape in shapes {
    print(shape.accept(areaVisitor))
    print(shape.accept(perimeterVisitor))
}
