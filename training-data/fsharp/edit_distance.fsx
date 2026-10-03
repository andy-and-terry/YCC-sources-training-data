let editDistance (a: string) (b: string) =
    let dp = Array2D.create (a.Length + 1) (b.Length + 1) 0

    for i in 0 .. a.Length do
        dp.[i, 0] <- i
    for j in 0 .. b.Length do
        dp.[0, j] <- j

    for i in 1 .. a.Length do
        for j in 1 .. b.Length do
            if a.[i - 1] = b.[j - 1] then
                dp.[i, j] <- dp.[i - 1, j - 1]
            else
                dp.[i, j] <- 1 + min dp.[i - 1, j - 1] (min dp.[i - 1, j] dp.[i, j - 1])

    dp.[a.Length, b.Length]

printfn "%d" (editDistance "horse" "ros")
printfn "%d" (editDistance "intention" "execution")
