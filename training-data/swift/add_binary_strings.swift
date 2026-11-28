func addBinary(_ a: String, _ b: String) -> String {
    let x = Array(a.reversed()), y = Array(b.reversed())
    var out: [Character] = []
    var carry = 0
    for i in 0..<max(x.count, y.count) {
        let sum = carry + (i < x.count ? Int(String(x[i]))! : 0) + (i < y.count ? Int(String(y[i]))! : 0)
        out.append(sum % 2 == 1 ? "1" : "0")
        carry = sum / 2
    }
    if carry > 0 { out.append("1") }
    return String(out.reversed())
}

print(addBinary("1010", "1011")) // 10101
