let dijkstra (graph: Map<string, (string * int) list>) source =
    let nodes = Map.toList graph |> List.map fst
    let mutable dist = nodes |> List.map (fun n -> n, System.Int32.MaxValue) |> Map.ofList
    dist <- Map.add source 0 dist
    let visited = System.Collections.Generic.HashSet<string>()

    for _ in 1 .. List.length nodes do
        let candidate =
            dist
            |> Map.toList
            |> List.filter (fun (n, _) -> not (visited.Contains n))
            |> List.sortBy snd
            |> List.tryHead
        match candidate with
        | None -> ()
        | Some(node, nodeDist) ->
            visited.Add node |> ignore
            match Map.tryFind node graph with
            | Some neighbors ->
                for (neighbor, weight) in neighbors do
                    let newDist = nodeDist + weight
                    if newDist < Map.find neighbor dist then
                        dist <- Map.add neighbor newDist dist
            | None -> ()
    dist

let graph =
    Map.ofList
        [ "a", [ "b", 1; "c", 4 ]
          "b", [ "c", 2; "d", 5 ]
          "c", [ "d", 1 ]
          "d", [] ]

printfn "%A" (dijkstra graph "a")
