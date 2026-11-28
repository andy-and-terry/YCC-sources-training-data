let rec digitSquareSum n = if n = 0 then 0 else (n % 10) * (n % 10) + digitSquareSum (n / 10)

let isHappy n =
    let rec go seen n =
        if n = 1 then true
        elif Set.contains n seen then false
        else go (Set.add n seen) (digitSquareSum n)
    go Set.empty n

[ 1 .. 40 ] |> List.filter isHappy |> printfn "%A" // [1; 7; 10; 13; 19; 23; 28; 31; 32; 44]
