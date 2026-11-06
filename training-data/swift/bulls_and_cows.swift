// Bulls and Cows scoring for equal-length digit strings.
func score(_ secret: String, _ guess: String) -> (bulls: Int, cows: Int) {
    var bulls = 0
    var sc: [Character: Int] = [:]
    var gc: [Character: Int] = [:]
    for (s, g) in zip(secret, guess) {
        if s == g { bulls += 1 } else {
            sc[s, default: 0] += 1
            gc[g, default: 0] += 1
        }
    }
    let cows = sc.reduce(0) { $0 + min($1.value, gc[$1.key] ?? 0) }
    return (bulls, cows)
}

let result = score("1807", "7810")
print("\(result.bulls) bull(s), \(result.cows) cow(s)")
