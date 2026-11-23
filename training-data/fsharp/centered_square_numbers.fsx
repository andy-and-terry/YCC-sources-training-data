// 2n(n-1)+1
let term (n: int64) : int64 =
    ((2 * n) * (n - 1)) + 1

for n in 1L .. 15L do
    printfn "%2d -> %d" n (term n)
