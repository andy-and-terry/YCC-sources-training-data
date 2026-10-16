protocol Shape {
    func area() -> Double
}

struct Square: Shape {
    let side: Double
    func area() -> Double { side * side }
}

struct Circle: Shape {
    let radius: Double
    func area() -> Double { Double.pi * radius * radius }
}

func makeUnitSquare() -> some Shape {
    Square(side: 1)
}

func describe(_ shape: some Shape) -> String {
    "area = \(String(format: "%.2f", shape.area()))"
}

print(describe(makeUnitSquare()))
print(describe(Circle(radius: 2)))
