let a = set [ 1; 2; 3; 4 ]
let b = Set.ofList [ 3; 4; 5; 6 ]

printfn "union: %A" (Set.union a b)
printfn "intersect: %A" (Set.intersect a b)
printfn "difference: %A" (a - b)
printfn "subset: %b" (Set.isSubset (set [ 1; 2 ]) a)
printfn "contains 3: %b" (a.Contains 3)
printfn "added: %A" (Set.add 10 a)
printfn "evens: %A" (Set.filter (fun x -> x % 2 = 0) a)
printfn "mapped: %A" (Set.map (fun x -> x % 3) a)

let unique = [ 5; 3; 5; 1; 3 ] |> Set.ofList |> Set.toList
printfn "unique sorted: %A" unique
printfn "min/max: %d %d" (Set.minElement a) (Set.maxElement a)
