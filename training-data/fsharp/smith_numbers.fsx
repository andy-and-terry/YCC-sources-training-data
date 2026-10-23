let rec digitSum (n: int) : int =
    if n < 10 then n else (n % 10) + digitSum (n / 10)

// prime factors with multiplicity
let primeFactors (n: int) : int list =
    let rec loop m p acc =
        if m = 1 then List.rev acc
        elif p * p > m then List.rev (m :: acc)
        elif m % p = 0 then loop (m / p) p (p :: acc)
        else loop m (p + 1) acc
    loop n 2 []

let isSmith (n: int) : bool =
    let factors = primeFactors n
    List.length factors > 1
    && digitSum n = (factors |> List.map digitSum |> List.sum)

let smiths = [ 4 .. 99 ] |> List.filter isSmith
printfn "%s" (smiths |> List.map string |> String.concat " ")
