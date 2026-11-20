// Lattice paths with iterated prefix sums.
let lattice n =
    let step row = List.scan (+) 0 row |> List.tail
    List.fold (fun row _ -> step row) (List.replicate (n + 1) 1L) [ 1 .. n ] |> List.last
printfn "%d" (lattice 3)
