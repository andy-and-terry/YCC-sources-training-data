let temps = [ 20; 23; 21; 25; 30 ]

temps
|> List.pairwise
|> List.map (fun (a, b) -> b - a)
|> printfn "diffs: %A"

let names = [ "a"; "b"; "c" ]
let ages = [ 10; 20; 30 ]
let towns = [ "X"; "Y"; "Z" ]

List.zip3 names ages towns |> printfn "%A"
List.map3 (fun n a t -> sprintf "%s(%d)@%s" n a t) names ages towns |> printfn "%A"

let (ns, ags, ts) = List.unzip3 (List.zip3 names ages towns)
printfn "%A %A %A" ns ags ts
List.mapi2 (fun i a b -> i, a, b) names ages |> printfn "%A"
