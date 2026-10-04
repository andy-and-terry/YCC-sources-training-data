let nextRow row = List.map2 (+) (0 :: row) (row @ [ 0 ])

let pascal n =
    [ 1 ]
    |> Seq.unfold (fun row -> Some(row, nextRow row))
    |> Seq.take n
    |> Seq.toList

for row in pascal 6 do
    printfn "%s" (row |> List.map string |> String.concat " ")
