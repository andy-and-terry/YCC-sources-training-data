enum Token { case number(Double), op(Character), paren(open: Bool) }
func show(_ t: Token) -> String {
    switch t {
    case .number(let n): return "num \(n)"
    case .op(let c): return "op \(c)"
    case .paren(let open): return open ? "(" : ")"
    }
}
print([Token.number(1.5), .op("+"), .paren(open: true)].map(show))
