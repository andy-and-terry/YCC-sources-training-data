func isPrime(_ n: Int) -> Bool {
    n >= 2 && !(2..<max(n, 3)).prefix { $0 * $0 <= n }.contains { n % $0 == 0 }
}

func isPalindrome(_ n: Int) -> Bool {
    let s = String(n)
    return s == String(s.reversed())
}

print((2..<200).filter { isPalindrome($0) && isPrime($0) })
// [2, 3, 5, 7, 11, 101, 131, 151, 181, 191]
