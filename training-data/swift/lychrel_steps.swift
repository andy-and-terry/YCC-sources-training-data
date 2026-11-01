// Reverse-and-add until a palindrome; count the steps.
func reversed(_ n: Int) -> Int {
    Int(String(String(n).reversed()))!
}

func steps(_ start: Int) -> Int {
    var n = start
    for count in 0..<50 {
        if count > 0 && n == reversed(n) { return count }
        n += reversed(n)
    }
    return -1
}

print([56, 57, 59, 79, 89].map { String(steps($0)) }.joined(separator: " "))
