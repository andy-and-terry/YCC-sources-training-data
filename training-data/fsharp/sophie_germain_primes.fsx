// Sophie Germain primes: p prime and 2p + 1 prime.
let isPrime n =
    n >= 2 && Seq.forall (fun d -> n % d <> 0) (Seq.takeWhile (fun d -> d * d <= n) (Seq.initInfinite (fun i -> i + 2)))

[ 2 .. 99 ] |> List.filter (fun p -> isPrime p && isPrime (2 * p + 1)) |> List.map string |> String.concat " " |> printfn "%s"
