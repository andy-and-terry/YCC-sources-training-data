let numbers = Array(1...20)

for n in numbers where n % 3 == 0 {
    print("multiple of 3: \(n)")
}

let optionals: [Int?] = [1, nil, 3, nil, 5]
for case let value? in optionals {
    print("value: \(value)")
}

enum Shape {
    case circle(Double)
    case square(Double)
}

let shapes: [Shape] = [.circle(1.0), .square(2.0), .circle(3.5)]
for case .circle(let radius) in shapes where radius > 2 {
    print("big circle radius \(radius)")
}
