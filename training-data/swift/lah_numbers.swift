// Unsigned Lah numbers L(n, k) = C(n-1, k-1) * n! / k!  (row n = 5).
func fact(_ n: Int) -> Int { n <= 1 ? 1 : n * fact(n - 1) }
func comb(_ n: Int, _ k: Int) -> Int { fact(n) / (fact(k) * fact(n - k)) }

let n = 5
let row = (1...n).map { k in comb(n - 1, k - 1) * fact(n) / fact(k) }
print(row.map(String.init).joined(separator: " "))
