func classify(_ value: Any) -> String {
    switch value {
    case let n as Int where n < 0: return "negative int \(n)"
    case 0 as Int: return "zero"
    case let n as Int: return "int \(n)"
    case let s as String where s.isEmpty: return "empty string"
    case let s as String: return "string \(s)"
    case let (a, b) as (Int, Int): return "pair sum \(a + b)"
    default: return "unknown"
    }
}

for v in [-5, 0, 42] as [Any] { print(classify(v)) }
print(classify(""), classify("hi"), classify((2, 3)), classify(3.5))

let point = (3, 0)
switch point {
case (0, 0): print("origin")
case (let x, 0): print("on x axis at \(x)")
case (0, let y): print("on y axis at \(y)")
case (1...5, 1...5): print("near origin")
default: print("elsewhere")
}

switch 7 {
case 1...5: print("low")
case 6...10: print("high")
default: break
}
