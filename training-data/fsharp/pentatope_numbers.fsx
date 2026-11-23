// n(n+1)(n+2)(n+3)/24
let term (n: int64) : int64 =
    (((n * (n + 1)) * (n + 2)) * (n + 3)) / 24

for n in 1L .. 15L do
    printfn "%2d -> %d" n (term n)
