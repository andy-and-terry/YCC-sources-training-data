indirect enum Expr {
    case number(Double)
    case add(Expr, Expr)
    case subtract(Expr, Expr)
    case multiply(Expr, Expr)
    case negate(Expr)
}

func evaluate(_ expr: Expr) -> Double {
    switch expr {
    case .number(let value):
        return value
    case .add(let lhs, let rhs):
        return evaluate(lhs) + evaluate(rhs)
    case .subtract(let lhs, let rhs):
        return evaluate(lhs) - evaluate(rhs)
    case .multiply(let lhs, let rhs):
        return evaluate(lhs) * evaluate(rhs)
    case .negate(let inner):
        return -evaluate(inner)
    }
}

func describe(_ expr: Expr) -> String {
    switch expr {
    case .number(let value):
        return "\(value)"
    case .add(let lhs, let rhs):
        return "(\(describe(lhs)) + \(describe(rhs)))"
    case .subtract(let lhs, let rhs):
        return "(\(describe(lhs)) - \(describe(rhs)))"
    case .multiply(let lhs, let rhs):
        return "(\(describe(lhs)) * \(describe(rhs)))"
    case .negate(let inner):
        return "-\(describe(inner))"
    }
}

let expression: Expr = .multiply(.add(.number(2), .number(3)), .negate(.number(4)))
print(describe(expression))
print(evaluate(expression))

indirect enum LinkedNode<T> {
    case empty
    case node(T, LinkedNode<T>)
}

func sum(_ list: LinkedNode<Int>) -> Int {
    switch list {
    case .empty:
        return 0
    case .node(let value, let rest):
        return value + sum(rest)
    }
}

let list: LinkedNode<Int> = .node(1, .node(2, .node(3, .empty)))
print(sum(list))
