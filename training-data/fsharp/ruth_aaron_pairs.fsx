// Sum of prime factors counted with multiplicity.
let sopfr n =
    let rec go n p acc =
        if n = 1 then acc
        elif p * p > n then acc + n
        elif n % p = 0 then go (n / p) p (acc + p)
        else go n (p + 1) acc
    go n 2 0

[ 2 .. 109 ]
|> List.filter (fun n -> sopfr n = sopfr (n + 1))
|> List.map string
|> String.concat " "
|> printfn "%s"
