enum ParseError: Error { case empty, notNumber(String) }

func parse(_ s: String) -> Result<Int, ParseError> {
    if s.isEmpty { return .failure(.empty) }
    guard let n = Int(s) else { return .failure(.notNumber(s)) }
    return .success(n)
}

for input in ["12", "", "x1"] {
    switch parse(input) {
    case .success(let n): print("ok", n)
    case .failure(let e): print("fail", e)
    }
}
