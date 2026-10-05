enum Shape {
    case circle(radius: Double)
    case rect(width: Double, height: Double)
    case point
}

func describe(_ value: Any) -> String {
    switch value {
    case let n as Int where n < 0:
        return "negative int \(n)"
    case 0 as Int:
        return "zero"
    case let n as Int:
        return "int \(n)"
    case let s as String where s.isEmpty:
        return "empty string"
    case let s as String:
        return "string '\(s)'"
    case let (a, b) as (Int, Int):
        return "pair summing to \(a + b)"
    default:
        return "something else"
    }
}

func area(_ shape: Shape) -> Double {
    switch shape {
    case .circle(let r): return Double.pi * r * r
    case .rect(let w, let h): return w * h
    case .point: return 0
    }
}

for item: Any in [-4, 0, 9, "", "hi", (2, 3), 3.5] {
    print(describe(item))
}
print(area(.rect(width: 2, height: 3)))

let age = 27
switch age {
case 0..<13: print("child")
case 13...19: print("teen")
default: print("adult")
}
