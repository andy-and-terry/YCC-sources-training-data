let isPrime n = n >= 2 && Seq.forall (fun i -> n % i <> 0) (seq { 2 .. int (sqrt (float n)) })

Seq.initInfinite (fun i -> let y = i + 1 in 3 * y * y + 3 * y + 1)
|> Seq.filter isPrime
|> Seq.take 8
|> Seq.toList
|> printfn "%A"
