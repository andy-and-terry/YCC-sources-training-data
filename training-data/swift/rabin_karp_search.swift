func rabinKarpSearch(text: String, pattern: String) -> [Int] {
    let textChars = Array(text)
    let patternChars = Array(pattern)
    let n = textChars.count
    let m = patternChars.count
    guard m > 0, n >= m else { return [] }

    let base = 256
    let modulus = 1_000_000_007
    var highOrder = 1
    for _ in 0..<(m - 1) {
        highOrder = (highOrder * base) % modulus
    }

    var patternHash = 0
    var windowHash = 0
    for i in 0..<m {
        patternHash = (patternHash * base + Int(patternChars[i].asciiValue ?? 0)) % modulus
        windowHash = (windowHash * base + Int(textChars[i].asciiValue ?? 0)) % modulus
    }

    var matches: [Int] = []
    for i in 0...(n - m) {
        if windowHash == patternHash {
            if Array(textChars[i..<(i + m)]) == patternChars {
                matches.append(i)
            }
        }
        if i < n - m {
            let leading = Int(textChars[i].asciiValue ?? 0)
            let trailing = Int(textChars[i + m].asciiValue ?? 0)
            windowHash = (windowHash - leading * highOrder % modulus + modulus) % modulus
            windowHash = (windowHash * base + trailing) % modulus
        }
    }
    return matches
}

let text = "abracadabra abra cadabra"
let pattern = "abra"
print(rabinKarpSearch(text: text, pattern: pattern))
