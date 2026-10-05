let nextRow (row: int list) =
    List.zip (0 :: row) (row @ [ 0 ]) |> List.map (fun (a, b) -> a + b)

let pascal n =
    [ 1 ] |> List.unfold (fun row -> Some(row, nextRow row)) |> List.truncate n

for row in pascal 6 do
    printfn "%s" (row |> List.map string |> String.concat " ")
