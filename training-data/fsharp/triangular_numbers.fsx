let triangular = Seq.initInfinite ((+) 1) |> Seq.scan (+) 0 |> Seq.skip 1

triangular |> Seq.take 10 |> List.ofSeq |> printfn "%A"
