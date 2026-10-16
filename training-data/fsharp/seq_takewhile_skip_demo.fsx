let naturals = Seq.initInfinite id

naturals |> Seq.skip 5 |> Seq.take 5 |> Seq.toList |> printfn "%A"
naturals |> Seq.takeWhile (fun n -> n * n < 50) |> Seq.toList |> printfn "%A"
naturals |> Seq.skipWhile (fun n -> n < 100) |> Seq.head |> printfn "%d"

[ 3; 1; 4; 1; 5; 9; 2; 6 ]
|> Seq.truncate 5
|> Seq.toList
|> printfn "%A"

seq { 1 .. 20 }
|> Seq.filter (fun n -> n % 4 = 0)
|> Seq.tryLast
|> printfn "%A"
