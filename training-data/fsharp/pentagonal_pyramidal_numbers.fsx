// n^2(n+1)/2
let term (n: int64) : int64 =
    ((n * n) * (n + 1)) / 2

for n in 1L .. 15L do
    printfn "%2d -> %d" n (term n)
