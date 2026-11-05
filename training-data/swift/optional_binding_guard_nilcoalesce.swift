func parse(_ s: String) -> Int? { Int(s) }

func double(_ s: String) -> Int {
    guard let n = parse(s) else { return -1 }
    return n * 2
}

print(double("21"), double("x"))
let name: String? = nil
print(name ?? "anon")
if let n = parse("7"), n > 5 { print("big \(n)") }
