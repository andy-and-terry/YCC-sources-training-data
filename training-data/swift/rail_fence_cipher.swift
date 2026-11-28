func encode(_ text: String, rails: Int) -> String {
    var rows = Array(repeating: "", count: rails)
    var r = 0, step = 1
    for ch in text {
        rows[r].append(ch)
        if r == 0 { step = 1 } else if r == rails - 1 { step = -1 }
        r += step
    }
    return rows.joined()
}

print(encode("WEAREDISCOVERED", rails: 3))
