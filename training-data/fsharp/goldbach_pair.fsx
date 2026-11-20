// Goldbach pair returning an option.
let isPrime n = n > 1 && Seq.forall (fun d -> n % d <> 0) (seq { 2 .. int (sqrt (float n)) })
let goldbach n = seq { 2 .. n / 2 } |> Seq.tryFind (fun p -> isPrime p && isPrime (n - p)) |> Option.map (fun p -> p, n - p)
printfn "%A" (goldbach 28)
