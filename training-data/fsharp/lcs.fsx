let lcs (a: string) (b: string) =
    let n = a.Length
    let m = b.Length
    let dp = Array2D.create (n + 1) (m + 1) 0
    for i in 1 .. n do
        for j in 1 .. m do
            if a.[i - 1] = b.[j - 1] then
                dp.[i, j] <- dp.[i - 1, j - 1] + 1
            else
                dp.[i, j] <- max dp.[i - 1, j] dp.[i, j - 1]

    let rec build i j =
        if i = 0 || j = 0 then []
        elif a.[i - 1] = b.[j - 1] then a.[i - 1] :: build (i - 1) (j - 1)
        elif dp.[i - 1, j] >= dp.[i, j - 1] then build (i - 1) j
        else build i (j - 1)

    dp.[n, m], System.String(build n m |> List.rev |> List.toArray)

printfn "%A" (lcs "ABCBDAB" "BDCABA")
