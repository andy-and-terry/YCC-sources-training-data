// Munchausen numbers: sum of digit^digit equals n (0^0 counted as 0).
func isMunchausen(_ n: Int) -> Bool {
    var sum = 0
    for c in String(n) {
        let d = c.wholeNumberValue!
        if d > 0 {
            var p = 1
            for _ in 0..<d { p *= d }
            sum += p
        }
    }
    return sum == n
}

print((1..<5000).filter(isMunchausen).map(String.init).joined(separator: " "))
