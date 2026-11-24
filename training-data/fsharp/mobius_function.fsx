// Moebius function: 0 if n has a squared prime factor, else (-1)^k.
let mobius n =
    let rec go m p acc =
        if p * p > m then (if m > 1 then -acc else acc)
        elif m % p = 0 then
            let m' = m / p
            if m' % p = 0 then 0 else go m' (p + 1) (-acc)
        else go m (p + 1) acc
    go n 2 1

[ 1 .. 30 ] |> List.map mobius |> List.map string |> String.concat " " |> printfn "%s"
