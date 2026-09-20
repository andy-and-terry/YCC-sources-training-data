let editDistance (a: string) (b: string) =
    let m, n = a.Length, b.Length
    let dp = Array2D.create (m + 1) (n + 1) 0
    for i in 0 .. m do
        dp.[i, 0] <- i
    for j in 0 .. n do
        dp.[0, j] <- j
    for i in 1 .. m do
        for j in 1 .. n do
            if a.[i - 1] = b.[j - 1] then
                dp.[i, j] <- dp.[i - 1, j - 1]
            else
                dp.[i, j] <- 1 + min dp.[i - 1, j - 1] (min dp.[i - 1, j] dp.[i, j - 1])
    dp.[m, n]

printfn "%d" (editDistance "kitten" "sitting")
