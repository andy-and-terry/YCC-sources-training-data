let isPrime n =
    n >= 2 && Seq.initInfinite (fun i -> i + 2) |> Seq.takeWhile (fun d -> d * d <= n) |> Seq.forall (fun d -> n % d <> 0)

let found =
    Seq.initInfinite (fun i -> i + 2)
    |> Seq.filter (fun p -> isPrime p && isPrime (2 * p + 1))
    |> Seq.take 10

printfn "%s" (found |> Seq.map string |> String.concat " ") // 2 3 5 11 23 29 41 53 83 89
