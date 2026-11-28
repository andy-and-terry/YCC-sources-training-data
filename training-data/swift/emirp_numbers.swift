func isPrime(_ n: Int) -> Bool {
    guard n >= 2 else { return false }
    var i = 2
    while i * i <= n {
        if n % i == 0 { return false }
        i += 1
    }
    return true
}

func reversed(_ n: Int) -> Int { Int(String(String(n).reversed()))! }

let emirps = (2..<200).filter { reversed($0) != $0 && isPrime($0) && isPrime(reversed($0)) }
print(emirps) // [13, 17, 31, 37, 71, 73, 79, 97, 107, 113, 149, 157, 167, 179, 199]
