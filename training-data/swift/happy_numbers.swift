func isHappy(_ start: Int) -> Bool {
    var seen = Set<Int>()
    var n = start
    while n != 1 && !seen.contains(n) {
        seen.insert(n)
        n = String(n).reduce(0) { $0 + Int(String($1))! * Int(String($1))! }
    }
    return n == 1
}

print((1...40).filter(isHappy)) // [1, 7, 10, 13, 19, 23, 28, 31, 32, 44]
