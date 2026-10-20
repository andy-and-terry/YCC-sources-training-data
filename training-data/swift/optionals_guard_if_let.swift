func parse(_ s: String?) -> Int? {
    guard let s = s, let n = Int(s), n >= 0 else { return nil }
    return n
}

let inputs: [String?] = ["42", "-1", nil, "x"]
for i in inputs {
    if let n = parse(i) { print("ok \(n)") } else { print("invalid") }
}
let name: String? = nil
print(name ?? "anonymous", name?.count ?? 0)
let nested: Int?? = 5
if case let .some(.some(v)) = nested { print(v) }
let words = ["1", "two", "3"].compactMap { Int($0) }
print(words)
