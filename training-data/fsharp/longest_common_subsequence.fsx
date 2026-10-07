let lcs (a: string) (b: string) =
    let m, n = a.Length, b.Length
    let table = Array2D.create (m + 1) (n + 1) 0
    for i in 1 .. m do
        for j in 1 .. n do
            if a.[i - 1] = b.[j - 1] then
                table.[i, j] <- table.[i - 1, j - 1] + 1
            else
                table.[i, j] <- max table.[i - 1, j] table.[i, j - 1]
    table.[m, n]

printfn "%d" (lcs "ABCBDAB" "BDCABA")
printfn "%d" (lcs "programming" "gaming")
