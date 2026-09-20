let bellmanFord (edges: (string * string * int) list) (nodes: string list) source =
    let mutable dist = nodes |> List.map (fun n -> n, System.Int32.MaxValue) |> Map.ofList
    dist <- Map.add source 0 dist
    for _ in 1 .. List.length nodes - 1 do
        for (u, v, w) in edges do
            match Map.tryFind u dist with
            | Some du when du <> System.Int32.MaxValue ->
                let candidate = du + w
                if candidate < Map.find v dist then
                    dist <- Map.add v candidate dist
            | _ -> ()
    dist

let edges =
    [ "a", "b", 4
      "a", "c", 1
      "c", "b", 2
      "b", "d", 1
      "c", "d", 5 ]

let nodes = [ "a"; "b"; "c"; "d" ]

printfn "%A" (bellmanFord edges nodes "a")
