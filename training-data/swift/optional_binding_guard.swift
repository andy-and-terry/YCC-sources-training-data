func describe(_ input: String?) -> String {
    guard let text = input, !text.isEmpty else { return "nothing" }
    return "got \(text.count) chars"
}

print(describe(nil), describe(""), describe("swift"))
let n = Int("42") ?? 0
if let v = Int("x"), v > 0 { print(v) } else { print("not positive", n) }
