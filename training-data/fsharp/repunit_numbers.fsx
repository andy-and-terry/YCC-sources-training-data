// Repunits: numbers made only of the digit 1.
let repunits = Seq.unfold (fun r -> let next = r * 10L + 1L in Some(next, next)) 0L

repunits |> Seq.take 5 |> Seq.toList |> printfn "%A"
