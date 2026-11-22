// Twin primes: pairs (p, p+2) both prime; print the lesser of each pair.
let isPrime n =
    n >= 2 && Seq.forall (fun d -> n % d <> 0) (Seq.takeWhile (fun d -> d * d <= n) (Seq.initInfinite (fun i -> i + 2)))

[ 2 .. 99 ] |> List.filter (fun p -> isPrime p && isPrime (p + 2)) |> List.map string |> String.concat " " |> printfn "%s"
