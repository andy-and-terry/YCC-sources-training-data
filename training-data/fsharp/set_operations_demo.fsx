let a = Set.ofList [ 1; 2; 3; 4 ]
let b = Set.ofList [ 3; 4; 5 ]

printfn "union: %A" (Set.union a b)
printfn "intersect: %A" (Set.intersect a b)
printfn "difference: %A" (a - b)
printfn "subset: %b" (Set.isSubset (set [ 1; 2 ]) a)
printfn "contains 3: %b" (a.Contains 3)
printfn "mapped: %A" (a |> Set.map (fun x -> x % 2))
printfn "partition: %A" (Set.partition (fun x -> x > 2) a)
printfn "unique: %A" ([ 3; 1; 3; 2; 1 ] |> set |> Set.toList)
