let lcsLength (a: string) (b: string) =
    let m, n = a.Length, b.Length
    let dp = Array2D.create (m + 1) (n + 1) 0

    for i in 1 .. m do
        for j in 1 .. n do
            if a.[i - 1] = b.[j - 1] then
                dp.[i, j] <- dp.[i - 1, j - 1] + 1
            else
                dp.[i, j] <- max dp.[i - 1, j] dp.[i, j - 1]

    dp.[m, n]

printfn "%d" (lcsLength "abcde" "ace")
printfn "%d" (lcsLength "abc" "abc")
printfn "%d" (lcsLength "abc" "def")
