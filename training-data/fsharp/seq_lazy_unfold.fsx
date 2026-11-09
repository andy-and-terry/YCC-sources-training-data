let fibs = Seq.unfold (fun (a, b) -> Some (a, (b, a + b))) (0, 1)
fibs |> Seq.take 10 |> Seq.toList |> printfn "%A"
