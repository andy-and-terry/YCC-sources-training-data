enum Shape {
    case circle(radius: Double)
    case rect(width: Double, height: Double)
    case triangle(a: Double, b: Double, c: Double)

    var area: Double {
        switch self {
        case .circle(let r): return Double.pi * r * r
        case .rect(let w, let h): return w * h
        case .triangle(let a, let b, let c):
            let s = (a + b + c) / 2
            return (s * (s - a) * (s - b) * (s - c)).squareRoot()
        }
    }
}

let shapes: [Shape] = [.circle(radius: 1), .rect(width: 2, height: 3), .triangle(a: 3, b: 4, c: 5)]
for s in shapes { print(String(format: "%.2f", s.area)) }
