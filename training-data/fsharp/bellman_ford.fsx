let bellmanFord (edges: (string * string * int) list) (nodes: string list) source =
    let mutable dist = nodes |> List.map (fun n -> n, System.Int32.MaxValue) |> Map.ofList
    dist <- Map.add source 0 dist

    for _ in 1 .. List.length nodes - 1 do
        for (from, dest, weight) in edges do
            let fromDist = Map.find from dist
            if fromDist <> System.Int32.MaxValue && fromDist + weight < Map.find dest dist then
                dist <- Map.add dest (fromDist + weight) dist

    dist

let edges =
    [ "a", "b", 4
      "a", "c", 1
      "c", "b", 2
      "b", "d", 1
      "c", "d", 5 ]

let nodes = [ "a"; "b"; "c"; "d" ]

printfn "%A" (bellmanFord edges nodes "a")
