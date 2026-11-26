// Sexy primes below 100; expect 16 pairs.
let isPrime n =
    n > 1 && Seq.forall (fun d -> n % d <> 0) (seq { 2 .. int (sqrt (float n)) })

printfn "%d" ([ 2 .. 99 ] |> List.filter (fun p -> isPrime p && isPrime (p + 6)) |> List.length)
