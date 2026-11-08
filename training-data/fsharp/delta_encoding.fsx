let deltaEncode xs = List.head xs :: (List.pairwise xs |> List.map (fun (a, b) -> b - a))
let deltaDecode ds = List.scan (+) 0 ds |> List.tail

let d = deltaEncode [ 10; 12; 15; 15; 20 ]
printfn "%A" d
printfn "%A" (deltaDecode d)
