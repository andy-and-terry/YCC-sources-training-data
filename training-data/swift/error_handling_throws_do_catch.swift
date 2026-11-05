enum ParseError: Error { case empty, notNumber(String) }

func parse(_ s: String) throws -> Int {
    if s.isEmpty { throw ParseError.empty }
    guard let n = Int(s) else { throw ParseError.notNumber(s) }
    return n
}

for s in ["5", "", "x"] {
    do { print(try parse(s)) }
    catch ParseError.empty { print("empty") }
    catch ParseError.notNumber(let t) { print("nan \(t)") }
}
print((try? parse("9")) ?? 0)
