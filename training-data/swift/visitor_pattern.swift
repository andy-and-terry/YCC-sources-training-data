protocol ShapeVisitor {
    func visit(_ circle: Circle) -> Double
    func visit(_ rectangle: Rectangle) -> Double
}

protocol Shape {
    func accept(_ visitor: ShapeVisitor) -> Double
}

final class Circle: Shape {
    let radius: Double
    init(radius: Double) { self.radius = radius }
    func accept(_ visitor: ShapeVisitor) -> Double { visitor.visit(self) }
}

final class Rectangle: Shape {
    let width: Double
    let height: Double
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
    func accept(_ visitor: ShapeVisitor) -> Double { visitor.visit(self) }
}

final class AreaVisitor: ShapeVisitor {
    func visit(_ circle: Circle) -> Double {
        Double.pi * circle.radius * circle.radius
    }
    func visit(_ rectangle: Rectangle) -> Double {
        rectangle.width * rectangle.height
    }
}

final class PerimeterVisitor: ShapeVisitor {
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
    let area = shape.accept(areaVisitor)
    let perimeter = shape.accept(perimeterVisitor)
    print("area=\(area), perimeter=\(perimeter)")
}
