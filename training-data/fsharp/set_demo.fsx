let a = set [ 1; 2; 3; 4; 5 ]
let b = set [ 4; 5; 6; 7 ]

printfn "%A" (Set.union a b)
printfn "%A" (Set.intersect a b)
printfn "%A" (Set.difference a b)
printfn "%b" (Set.isSubset (set [ 1; 2 ]) a)
printfn "%b" (Set.contains 3 a)
printfn "%A" (Set.add 10 a)
printfn "%A" (Set.remove 1 a)
printfn "%d" (Set.count a)
printfn "%A" (Set.map (fun n -> n % 3) a)
printfn "%A" (Set.filter (fun n -> n % 2 = 0) a)
printfn "%A" (Set.partition (fun n -> n > 2) a)
printfn "%d %d" (Set.minElement a) (Set.maxElement a)
printfn "%A" (a - b)
printfn "%A" ([ 3; 1; 3; 2; 1 ] |> Set.ofList |> Set.toList)
