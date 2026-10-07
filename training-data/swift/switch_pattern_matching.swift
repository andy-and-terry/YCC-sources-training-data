enum Shape {
    case circle(radius: Double)
    case rect(width: Double, height: Double)
    case point
}

func describe(_ shape: Shape) -> String {
    switch shape {
    case .circle(let r) where r > 10:
        return "large circle"
    case .circle:
        return "circle"
    case .rect(let w, let h) where w == h:
        return "square \(w)"
    case .rect(let w, let h):
        return "rect \(w)x\(h)"
    case .point:
        return "point"
    }
}

func classify(_ n: Int) -> String {
    switch n {
    case ..<0: return "negative"
    case 0: return "zero"
    case 1...9: return "digit"
    case let x where x.isMultiple(of: 2): return "big even"
    default: return "big odd"
    }
}

func pair(_ p: (Int, Int)) -> String {
    switch p {
    case (0, 0): return "origin"
    case (let x, 0): return "x-axis at \(x)"
    case (0, let y): return "y-axis at \(y)"
    default: return "elsewhere"
    }
}

print(describe(.circle(radius: 11)), describe(.rect(width: 2, height: 2)), describe(.point))
print(classify(-3), classify(5), classify(42), classify(43))
print(pair((0, 0)), pair((4, 0)), pair((0, 7)), pair((1, 1)))
