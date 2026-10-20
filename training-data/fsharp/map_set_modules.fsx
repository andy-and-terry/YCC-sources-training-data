let m = Map.ofList [ "a", 1; "b", 2; "c", 3 ]
printfn "%A" (m |> Map.add "d" 4 |> Map.remove "a")
printfn "%A %A %b" (Map.tryFind "b" m) (Map.tryFind "z" m) (Map.containsKey "c" m)
printfn "%A" (m |> Map.map (fun _ v -> v * 10) |> Map.toList)
printfn "%d" (m |> Map.fold (fun acc _ v -> acc + v) 0)
printfn "%A" (m |> Map.filter (fun _ v -> v > 1) |> Map.keys |> Seq.toList)
let s = Set.ofList [ 3; 1; 2; 3 ]
printfn "%A %A %b" s (Set.union s (Set.ofList [ 9 ])) (Set.contains 2 s)
printfn "%A" (Set.difference s (Set.ofList [ 1 ]) |> Set.toList)
let counts = "mississippi" |> Seq.countBy id |> Seq.sortByDescending snd |> Seq.toList
printfn "%A" counts
