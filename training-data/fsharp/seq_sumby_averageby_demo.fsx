type Item = { Name: string; Price: float; Qty: int }

let items =
    [ { Name = "pen"; Price = 1.5; Qty = 4 }
      { Name = "book"; Price = 12.0; Qty = 2 }
      { Name = "cup"; Price = 6.0; Qty = 1 } ]

printfn "%.2f" (items |> List.sumBy (fun i -> i.Price * float i.Qty))
printfn "%.2f" (items |> List.averageBy (fun i -> i.Price))
let priciest = items |> List.maxBy (fun i -> i.Price)
let fewest = items |> List.minBy (fun i -> i.Qty)
printfn "%s" priciest.Name
printfn "%s" fewest.Name
printfn "%d" (items |> Seq.sumBy (fun i -> i.Qty))
