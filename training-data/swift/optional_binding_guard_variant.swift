func parse(_ s: String?) -> Int {
    guard let s = s, let n = Int(s) else { return -1 }
    return n
}

print(parse("12"), parse("x"), parse(nil))
