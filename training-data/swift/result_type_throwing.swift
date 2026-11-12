enum E: Error { case neg }
func root(_ x: Double) throws -> Double {
    if x < 0 { throw E.neg }
    return x.squareRoot()
}
for v in [16.0, -1.0] {
    let r = Result { try root(v) }
    switch r {
    case .success(let s): print("ok", s)
    case .failure(let e): print("err", e)
    }
}
