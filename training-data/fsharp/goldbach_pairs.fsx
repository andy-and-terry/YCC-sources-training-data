let isPrime n = n > 1 && Seq.forall (fun d -> n % d <> 0) (seq { 2 .. int (sqrt (float n)) })

let goldbach n =
    [ for p in 2 .. n / 2 do
        if isPrime p && isPrime (n - p) then yield (p, n - p) ]

printfn "%A" (goldbach 28)
