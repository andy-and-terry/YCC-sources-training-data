let collatzLength n =
    let rec go n acc =
        if n = 1L then acc
        elif n % 2L = 0L then go (n / 2L) (acc + 1)
        else go (3L * n + 1L) (acc + 1)
    go n 1

printfn "%d" (collatzLength 27L)

let longest =
    seq { 1L .. 10000L }
    |> Seq.maxBy collatzLength

printfn "longest under 10000: %d (%d steps)" longest (collatzLength longest)
