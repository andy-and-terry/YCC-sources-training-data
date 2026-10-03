let lcs (s1: string) (s2: string) =
    let m = s1.Length
    let n = s2.Length
    let dp = Array2D.create (m + 1) (n + 1) 0

    for i in 1 .. m do
        for j in 1 .. n do
            if s1.[i - 1] = s2.[j - 1] then
                dp.[i, j] <- dp.[i - 1, j - 1] + 1
            else
                dp.[i, j] <- max dp.[i - 1, j] dp.[i, j - 1]

    dp.[m, n]

printfn "%d" (lcs "ABCBDAB" "BDCABA")
printfn "%d" (lcs "AGGTAB" "GXTXAYB")
