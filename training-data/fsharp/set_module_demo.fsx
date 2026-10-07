let a = Set.ofList [ 1; 2; 3; 4 ]
let b = Set.ofList [ 3; 4; 5 ]

printfn "union: %A" (Set.union a b)
printfn "intersect: %A" (Set.intersect a b)
printfn "difference: %A" (a - b)
printfn "contains 2: %b" (Set.contains 2 a)
printfn "subset: %b" (Set.isSubset (Set.ofList [ 1; 2 ]) a)

let words = [ "b"; "a"; "b"; "c"; "a" ]
words |> Set.ofList |> Set.toList |> printfn "%A"
Set.map (fun x -> x * x) a |> printfn "%A"
