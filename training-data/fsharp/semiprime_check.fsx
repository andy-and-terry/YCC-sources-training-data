let primeFactorCount n =
    let rec go n p count =
        if p * p > n then (if n > 1 then count + 1 else count)
        elif n % p = 0 then go (n / p) p (count + 1)
        else go n (p + 1) count
    go n 2 0

printfn "%A" [ for n in 2 .. 29 do if primeFactorCount n = 2 then yield n ]
