// Highest value reached by the Collatz (hailstone) sequence from n.
let peak (n: int64) =
    let rec go n best =
        if n = 1L then best
        else
            let next = if n % 2L = 0L then n / 2L else 3L * n + 1L
            go next (max best next)
    go n n

printfn "%d" (peak 27L)
