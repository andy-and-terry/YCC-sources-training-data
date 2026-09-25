func isValidISBN10(_ isbn: String) -> Bool {
    let chars = Array(isbn.filter { $0 != "-" })
    guard chars.count == 10 else { return false }
    var total = 0
    for (i, c) in chars.enumerated() {
        let v: Int
        if let d = c.wholeNumberValue { v = d }
        else if c == "X" && i == 9 { v = 10 }
        else { return false }
        total += v * (10 - i)
    }
    return total % 11 == 0
}

for s in ["3-598-21508-8", "3-598-21507-X", "3-598-21508-9"] { print(s, isValidISBN10(s)) }
