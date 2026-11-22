// Lazy caterer's sequence: max pieces from n straight cuts, n(n+1)/2 + 1.
let pieces = (0..<10).map { n in n * (n + 1) / 2 + 1 }
print(pieces.map(String.init).joined(separator: " "))
