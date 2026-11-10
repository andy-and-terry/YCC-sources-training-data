let centralDelannoy n =
    let g = Array2D.create (n + 1) (n + 1) 1L
    for i in 1 .. n do
        for j in 1 .. n do
            g.[i, j] <- g.[i - 1, j] + g.[i, j - 1] + g.[i - 1, j - 1]
    g.[n, n]

printfn "%s" ([ 0 .. 5 ] |> List.map (centralDelannoy >> string) |> String.concat " ") // 1 3 13 63 321 1683
