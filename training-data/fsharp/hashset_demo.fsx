open System.Collections.Generic

let seen = HashSet<int>()
let data = [ 4; 8; 15; 16; 23; 42; 8; 4 ]

let duplicates =
    data |> List.filter (fun x -> not (seen.Add x))

printfn "duplicates: %A" duplicates
printfn "count: %d" seen.Count
printfn "contains 15: %b" (seen.Contains 15)

let other = HashSet<int>([ 1; 4; 8; 100 ])
let common = HashSet<int>(seen)
common.IntersectWith other
printfn "%A" (Seq.sort common |> Seq.toList)

seen.UnionWith other
printfn "%d" seen.Count
seen.Remove 4 |> ignore
printfn "%b" (seen.Contains 4)
