let isPrime (n: int) : bool =
    n >= 2 && [ 2 .. n - 1 ] |> List.forall (fun d -> d * d > n || n % d <> 0)

let lucasLehmer (p: int) : bool =
    if p = 2 then true
    else
        let m = (1L <<< p) - 1L
        let mutable s = 4L
        for _ in 1 .. p - 2 do
            s <- (s * s - 2L) % m
        s = 0L

let exponents =
    [ 2 .. 19 ] |> List.filter (fun p -> isPrime p && lucasLehmer p)

printfn "%s" (exponents |> List.map string |> String.concat " ")
