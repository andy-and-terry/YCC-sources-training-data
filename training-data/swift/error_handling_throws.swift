enum ParseError: Error { case empty, notNumber(String) }

func parse(_ s: String) throws -> Int {
    if s.isEmpty { throw ParseError.empty }
    guard let n = Int(s) else { throw ParseError.notNumber(s) }
    return n
}

do {
    print(try parse("42"))
    print(try parse("x"))
} catch ParseError.notNumber(let s) {
    print("not a number: \(s)")
} catch {
    print(error)
}
