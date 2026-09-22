let editDistance (a: string) (b: string) =
    let n = a.Length
    let m = b.Length
    let dp = Array2D.create (n + 1) (m + 1) 0
    for i in 0 .. n do
        dp.[i, 0] <- i
    for j in 0 .. m do
        dp.[0, j] <- j
    for i in 1 .. n do
        for j in 1 .. m do
            if a.[i - 1] = b.[j - 1] then
                dp.[i, j] <- dp.[i - 1, j - 1]
            else
                dp.[i, j] <- 1 + min dp.[i - 1, j - 1] (min dp.[i - 1, j] dp.[i, j - 1])
    dp.[n, m]

printfn "%d" (editDistance "kitten" "sitting")
