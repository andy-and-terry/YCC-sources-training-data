let primeFactors n =
    let rec go n p acc =
        if n = 1 then acc
        elif p * p > n then n :: acc
        elif n % p = 0 then go (n / p) p (p :: acc)
        else go n (p + 1) acc
    go n 2 []

let isPowerful n =
    primeFactors n |> List.countBy id |> List.forall (fun (_, c) -> c >= 2)

printfn "%s" (String.concat " " [ for n in 1 .. 100 do if isPowerful n then yield string n ])
