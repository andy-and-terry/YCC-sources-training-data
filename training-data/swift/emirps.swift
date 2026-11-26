// Emirps below 200; expect 15.
func isPrime(_ n: Int) -> Bool {
    if n < 2 { return false }
    var d = 2
    while d * d <= n {
        if n % d == 0 { return false }
        d += 1
    }
    return true
}

func rev(_ n: Int) -> Int { Int(String(String(n).reversed()))! }
let found = (2..<200).filter { rev($0) != $0 && isPrime($0) && isPrime(rev($0)) }
print(found.count, found)
