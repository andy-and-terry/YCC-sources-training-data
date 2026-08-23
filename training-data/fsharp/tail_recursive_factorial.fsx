let factorial n =
    let rec go n acc = if n <= 1 then acc else go (n - 1) (acc * n)
    go n 1

printfn "%d" (factorial 10)
