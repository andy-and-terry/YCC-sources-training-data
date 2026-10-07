let catalan n =
    let table = Array.create (n + 1) 0L
    table.[0] <- 1L

    for i in 1 .. n do
        let mutable total = 0L
        for j in 0 .. i - 1 do
            total <- total + table.[j] * table.[i - 1 - j]
        table.[i] <- total

    table

printfn "%A" (catalan 10)
