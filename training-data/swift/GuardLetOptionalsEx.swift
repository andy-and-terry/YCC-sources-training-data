func area(_ w: String?, _ h: String?) -> Int? {
    guard let ws = w, let hs = h, let a = Int(ws), let b = Int(hs) else { return nil }
    return a * b
}

print(area("3", "4") ?? -1)
print(area("3", nil) ?? -1)
if case let x? = area("2", "5") { print(x) }
