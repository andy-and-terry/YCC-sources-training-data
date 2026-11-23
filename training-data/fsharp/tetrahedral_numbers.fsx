// n(n+1)(n+2)/6
let term (n: int64) : int64 =
    ((n * (n + 1)) * (n + 2)) / 6

for n in 1L .. 15L do
    printfn "%2d -> %d" n (term n)
