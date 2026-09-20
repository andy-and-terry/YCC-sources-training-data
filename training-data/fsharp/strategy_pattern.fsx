type Item = { Name: string; Price: float }

let sortByPriceAscending (items: Item list) =
    items |> List.sortBy (fun i -> i.Price)

let sortByPriceDescending (items: Item list) =
    items |> List.sortByDescending (fun i -> i.Price)

let sortByName (items: Item list) =
    items |> List.sortBy (fun i -> i.Name)

// The GoF Strategy pattern is just a function value in F#: no interface or
// class hierarchy of interchangeable "sorters" is needed.
let checkout (strategy: Item list -> Item list) (items: Item list) =
    strategy items

let items =
    [ { Name = "widget"; Price = 10.0 }
      { Name = "gadget"; Price = 25.0 }
      { Name = "gizmo"; Price = 5.0 } ]

printfn "%A" (checkout sortByPriceAscending items)
printfn "%A" (checkout sortByName items)
