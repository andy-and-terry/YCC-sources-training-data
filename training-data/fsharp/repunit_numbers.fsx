// Repunits: R_k = (10^k - 1) / 9, built as r = 10r + 1.
Seq.unfold (fun r -> Some(r, r * 10I + 1I)) 1I
|> Seq.take 8
|> Seq.map string |> String.concat " " |> printfn "%s"
