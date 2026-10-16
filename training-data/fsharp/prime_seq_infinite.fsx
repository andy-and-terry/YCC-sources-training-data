let isPrime n =
    n > 1 && Seq.forall (fun d -> n % d <> 0) (seq { 2 .. int (sqrt (float n)) })

let primes = Seq.initInfinite ((+) 2) |> Seq.filter isPrime

primes |> Seq.take 15 |> Seq.toList |> printfn "%A"
primes |> Seq.item 99 |> printfn "100th prime: %d"
primes |> Seq.takeWhile (fun p -> p < 60) |> Seq.sum |> printfn "sum below 60: %d"

// twin primes
primes
|> Seq.pairwise
|> Seq.filter (fun (a, b) -> b - a = 2)
|> Seq.take 5
|> Seq.toList
|> printfn "%A"
