enum Shape {
    case circle(radius: Double)
    case rectangle(width: Double, height: Double)
    case triangle(base: Double, height: Double)
}

func area(_ shape: Shape) -> Double {
    switch shape {
    case .circle(let radius):
        return Double.pi * radius * radius
    case .rectangle(let width, let height):
        return width * height
    case .triangle(let base, let height):
        return 0.5 * base * height
    }
}

let shapes: [Shape] = [.circle(radius: 2), .rectangle(width: 3, height: 4), .triangle(base: 6, height: 2)]
for shape in shapes {
    print(area(shape))
}
