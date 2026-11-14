enum Expr {
    case num(Double)
    indirect case add(Expr, Expr)
    indirect case mul(Expr, Expr)
}

func eval(_ e: Expr) -> Double {
    switch e {
    case .num(let n): return n
    case .add(let a, let b): return eval(a) + eval(b)
    case .mul(let a, let b): return eval(a) * eval(b)
    }
}

print(eval(.add(.num(2), .mul(.num(3), .num(4)))))
