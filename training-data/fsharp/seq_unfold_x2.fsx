let powersOfTwo = Seq.unfold (fun n -> Some (n, n * 2)) 1
powersOfTwo |> Seq.take 8 |> Seq.toList |> printfn "%A"
