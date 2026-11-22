// Euler zigzag numbers via the Seidel-Entringer boustrophedon.
let step (row: int64 list) = List.scan (+) 0L (List.rev row)

Seq.unfold (fun row -> Some(List.last row, step row)) [ 1L ]
|> Seq.take 10
|> Seq.map string |> String.concat " " |> printfn "%s"
