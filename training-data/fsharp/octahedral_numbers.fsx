// n(2n^2+1)/3
let term (n: int64) : int64 =
    (n * (((2 * n) * n) + 1)) / 3

for n in 1L .. 15L do
    printfn "%2d -> %d" n (term n)
