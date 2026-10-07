let csv = "alice,30,paris;bob,25,rome;carol,41,oslo"

let records =
    csv.Split(';')
    |> Array.map (fun row ->
        match row.Split(',') with
        | [| name; age; city |] -> Some(name, int age, city)
        | _ -> None)
    |> Array.choose id

for (name, age, city) in records do
    printfn "%-6s %3d %s" name age city

records
|> Array.map (fun (n, _, _) -> n.ToUpper())
|> String.concat " | "
|> printfn "%s"

printfn "%s" (System.String.Join("-", [ 1; 2; 3 ]))
