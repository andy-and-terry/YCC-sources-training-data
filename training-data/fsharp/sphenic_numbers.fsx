let primeFactors n =
    let rec go n p acc =
        if n = 1 then List.rev acc
        elif p * p > n then List.rev (n :: acc)
        elif n % p = 0 then go (n / p) p (p :: acc)
        else go n (p + 1) acc
    go n 2 []

let isSphenic n =
    let fs = primeFactors n
    List.length fs = 3 && List.length (List.distinct fs) = 3

printfn "%A" [ for n in 2 .. 79 do if isSphenic n then yield n ]
