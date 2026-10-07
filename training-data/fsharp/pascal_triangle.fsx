let nextRow row =
    List.zip (0 :: row) (row @ [ 0 ])
    |> List.map (fun (a, b) -> a + b)

let pascal n =
    Seq.unfold (fun row -> Some(row, nextRow row)) [ 1 ]
    |> Seq.truncate n
    |> Seq.toList

for row in pascal 7 do
    row |> List.map string |> String.concat " " |> printfn "%s"
