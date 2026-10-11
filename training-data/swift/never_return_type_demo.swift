func fail(_ message: String) -> Never {
    print("fatal: \(message)")
    exit(1)
}

func parsePositive(_ s: String) -> Int {
    guard let n = Int(s), n > 0 else {
        fail("not a positive integer: \(s)")
    }
    return n
}

print(parsePositive("42"))
print(parsePositive("7"))
